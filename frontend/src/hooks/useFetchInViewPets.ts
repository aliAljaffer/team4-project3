import { TPet } from "@/components/pets/Pet";
import { Map } from "leaflet";
import { RefObject } from "react";
import { useQuery } from "@tanstack/react-query";
import { API_URL, STALE_TIME } from "@/utils/helpers";
import useDebounce from "./useDebounce";

function useFetchInViewPets(map: RefObject<Map> | Map, trigger: number) {
  const mapBounds =
    map instanceof Map ? map.getBounds() : map?.current?.getBounds();
  const boundsKey = mapBounds
    ? `${mapBounds.getSouth()},${mapBounds.getNorth()},${mapBounds.getWest()},${mapBounds.getEast()}`
    : null;

  const debouncedTrigger = useDebounce(trigger, 300);

  const { data, error, isLoading, refetch } = useQuery<TPet[]>({
    queryKey: ["pets", "in-view", debouncedTrigger],
    queryFn: async () => {
      if (!boundsKey) return [];
      const [south, north, west, east] = boundsKey.split(",").map(Number);

      const params = new URLSearchParams({
        minLat: south.toString(),
        maxLat: north.toString(),
        minLng: west.toString(),
        maxLng: east.toString(),
      });

      const response = await fetch(`${API_URL}/api/pets?${params}`);
      if (!response.ok) {
        throw new Error("Failed to fetch pets");
      }
      return response.json();
    },
    staleTime: STALE_TIME,
    enabled: !!boundsKey && debouncedTrigger > 0, // Only fetch when map bounds are available
    placeholderData: (previousData) => previousData,
  });

  return { inView: data || [], error, isLoading, refetch };
}

export default useFetchInViewPets;
