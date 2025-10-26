import { API_URL, STALE_TIME } from "@/utils/helpers";
import useDebounce from "./useDebounce";
import { RefObject } from "react";
import { Map } from "leaflet";
import { useQuery } from "@tanstack/react-query";
import { PetRow, ReportRow } from "@/components/services/apiPets";

export default function useFetchMapData(
  map: RefObject<Map> | Map | undefined = undefined,
  trigger: number,
) {
  const mapBounds =
    map instanceof Map ? map.getBounds() : map?.current?.getBounds();
  const boundsKey = mapBounds
    ? `${mapBounds.getSouth()},${mapBounds.getNorth()},${mapBounds.getWest()},${mapBounds.getEast()}`
    : null;

  const debouncedTrigger = useDebounce(trigger, 300);

  const { data, error, isLoading } = useQuery<{
    pets: PetRow[];
    reports: ReportRow[];
  }>({
    queryKey: ["map-data", "in-view", debouncedTrigger],
    queryFn: async () => {
      if (!boundsKey) return [];
      const [south, north, west, east] = boundsKey.split(",").map(Number);

      const params = new URLSearchParams({
        minLat: south.toString(),
        maxLat: north.toString(),
        minLng: west.toString(),
        maxLng: east.toString(),
      });

      const response = await fetch(`${API_URL}/api/map-data?${params}`);
      if (!response.ok) {
        throw new Error("Failed to fetch map-data");
      }
      return response.json();
    },
    staleTime: STALE_TIME,
    enabled: !!boundsKey && debouncedTrigger > 0,
    placeholderData: (previousData) => previousData,
  });

  return {
    pets: data?.pets || [],
    reports: data?.reports || [],
    error,
    isLoading,
  };
}
