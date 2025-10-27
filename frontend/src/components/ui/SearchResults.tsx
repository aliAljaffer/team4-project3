import useFetchAllPets from "@/hooks/useFetchAllPets";
import { Spinner } from "@radix-ui/themes";
import { useNavigate } from "react-router-dom";
import { useChangeSelected } from "@/store";
import { APP_ROUTE, convertReportToPet } from "@/utils/helpers";
import { PetRow } from "../services/apiPets";

type SearchResultsProps = {
  searchTerm: string;
};
export default function SearchResults({ searchTerm }: SearchResultsProps) {
  const { data, isLoading } = useFetchAllPets("map-data");
  const changeSelected = useChangeSelected();
  const navigate = useNavigate();
  if (isLoading) return <Spinner />;
  if (!data) return null;
  const normalizedResults = data.reports
    .map(convertReportToPet)
    .concat(data.pets);
  const filteredResults = searchPets(normalizedResults, searchTerm);
  if (searchTerm.length < 1) return null;
  return (
    <div className="z-[9999] flex h-auto w-full flex-col gap-1 border-b border-zinc-700 bg-zinc-100">
      {filteredResults.length > 0 ? (
        filteredResults.slice(0, 8).map((pet) => (
          <div
            key={pet.caseId}
            onClick={() => {
              navigate(
                `${APP_ROUTE}?lat=${pet.position__latitude}&lng=${pet.position__longitude}`,
              );
              changeSelected(pet?.caseId!);
            }}
            className="flex items-center justify-start gap-1 border-b px-2 py-1 hover:cursor-pointer hover:border-b hover:border-zinc-700"
          >
            <span className="w-fit text-sm">{pet.name}</span>{" "}
            {pet.petType === "dog" ? "🐶" : "🐱"}{" "}
            <span className="truncate text-sm">{pet.description}</span>
          </div>
        ))
      ) : (
        <div className="flex items-center justify-center gap-2 py-2">
          No results found for {searchTerm} <span>😢</span>
        </div>
      )}
    </div>
  );
}

function searchPets(petsList: PetRow[], searchTerm: string): PetRow[] {
  if (!petsList.length) return [];
  if (searchTerm.length < 1) return [];
  return petsList.filter((pet) => {
    return (
      pet.breed?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pet.caseStatus.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pet.description?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pet.message?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pet.petType.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pet.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      pet.tags?.toLowerCase().includes(searchTerm.toLowerCase())
    );
  });
}
