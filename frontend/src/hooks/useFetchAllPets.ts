import { TPet } from "@/components/pets/Pet";
import { useQuery } from "@tanstack/react-query";
import { STALE_TIME } from "@/utils/helpers";
import { API_URL } from "@/utils/helpers";
import { PetRow, ReportRow } from "@/components/services/apiPets";

type FetchReturnType<T extends "pets" | "reports" | "map-data"> =
  T extends "pets"
    ? TPet[]
    : T extends "reports"
      ? ReportRow[]
      : { pets: PetRow[]; reports: ReportRow[] };

function useFetchAllPets<T extends "pets" | "reports" | "map-data">(type: T) {
  const { data, error, isLoading } = useQuery<FetchReturnType<T>>({
    queryKey: [type],
    queryFn: async () => {
      const response = await fetch(`${API_URL}/api/${type}`);
      if (!response.ok) {
        throw new Error(`Failed to fetch ${type}`);
      }
      const data = await response.json();
      return data as FetchReturnType<T>;
    },
    staleTime: STALE_TIME,
    placeholderData: (previousData) => previousData,
  });
  return { data, error, isLoading };
}

export default useFetchAllPets;
