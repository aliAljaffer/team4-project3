import { API_URL } from "@/utils/helpers";
import { FormData } from "@/components/pets/MakeReport";
import toast from "react-hot-toast";
import { QueryClient } from "@tanstack/react-query";

export type ReportRow = {
  name: string;
  caseId?: number | null;
  petType: "dog" | "cat";
  contact: string;
  isPetFoundReport: boolean;
  reportLatitude?: number;
  reportLongitude?: number;
  imageUrl?: string | null;
  message?: string;
  isCaseReviewed: boolean;
  language: FormData["language"];
};

export type PetRow = {
  name: string;
  caseId?: number;
  petType: "dog" | "cat";
  contact: string;
  isLost: boolean;
  caseStatus: "open" | "closed";
  position__latitude?: number;
  position__longitude?: number;
  imageUrl?: string | null;
  description?: string;
  message?: string;
  reporterName: string;
  reward: string;
  breed?: string;
  tags?: string;
  language: FormData["language"];
  reportDate: string;
  microchip__hasMicrochip: boolean;
  microchip__microchipNumber: string;
};

export const submitPetOrReport = async ({
  isReportingPetAsFound,
  data,
  queryClient,
}: {
  isReportingPetAsFound: boolean;
  data: ReportRow | PetRow;
  queryClient: QueryClient;
}) => {
  const url = isReportingPetAsFound ? "/api/reports" : "/api/pets";

  const response = await fetch(`${API_URL}${url}`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  });

  if (!response.ok) {
    let errorMessage = `Error ${response.status}`;
    try {
      const errorData = await response.json();
      if (errorData?.message) errorMessage = errorData.message;
    } catch {
      // Ignore JSON parsing errors
      // toast.error(errorMessage);
      throw new Error(errorMessage);
    }
  }

  const result = await response.json();

  if (isReportingPetAsFound) {
    toast.success("Found pet report submitted successfully!");
  } else {
    toast.success(`Lost pet report created with case ID: ${result.caseId}`);
  }
  queryClient.invalidateQueries({ queryKey: ["map-data"] });
  return result;
};
