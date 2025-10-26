import { PetRow, ReportRow } from "@/components/services/apiPets";
import { LatLngExpression, LatLngTuple } from "leaflet";

export function isDifferentCoord(
  posA: LatLngExpression,
  posB: LatLngExpression,
) {
  if (Array.isArray(posA) && Array.isArray(posB)) {
    if (posA[0] === posB[0] && posA[1] === posB[0]) return false;
  } else if (Array.isArray(posA) && !Array.isArray(posB)) {
    if (posA[0] === posB.lat && posA[1] === posB.lng) return false;
  } else if (!Array.isArray(posA) && Array.isArray(posB)) {
    if (posA.lat === posB[0] && posA.lng === posB[1]) return false;
  } else if (!Array.isArray(posA) && !Array.isArray(posB)) {
    if (posA.lat === posB.lat && posA.lng === posB.lng) return false;
  }
  return true;
}
export const API_URL = import.meta.env.VITE_CATUS_LOCATUS_API_URL || "";

export const DEFAULT_POINT: LatLngTuple = [24.732715, 46.676868];

export function formatDate(date: Date | string): string {
  let processedDate;
  if (typeof date === "string") {
    processedDate = new Date(date);
  } else processedDate = date;
  return new Intl.DateTimeFormat("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  }).format(processedDate);
}

export function obfuscate(str: string): string {
  const halfLen = Math.ceil(str.length / 2);
  const obfuscated = str.slice(0, halfLen);
  return obfuscated + c("*", halfLen);
}

export function c(char: string, num: number): string {
  return Array.from({ length: num }, () => char).join("");
}

export const STALE_TIME = 1000 * 60 * 60 * 12;
export const APP_ROUTE = "/";
export function convertReportToPet(report: ReportRow): PetRow {
  return {
    // Direct mappings
    name: report.name,
    caseId: report.caseId ?? Math.floor(Math.random() * 1000000), // fallback ID if missing
    petType: report.petType,
    contact: report.contact,
    language: report.language,

    // Derived or inferred fields
    isLost: !report.isPetFoundReport, // invert since found report != lost pet
    caseStatus: report.isCaseReviewed ? "closed" : "open",
    position__latitude: report.reportLatitude ?? 0,
    position__longitude: report.reportLongitude ?? 0,
    imageUrl: report.imageUrl ?? null,

    // Map similar fields
    description: report.message ?? "No description provided",
    message: report.message ?? "",
    reporterName: report.name, // fallback to same name for display
    reward: "0", // unknown reward by default
    breed: "unknown",
    tags: "",

    // Defaults for fields that don't exist in ReportRow
    reportDate: new Date().toISOString(),
    microchip__hasMicrochip: false,
    microchip__microchipNumber: "",
  };
}
