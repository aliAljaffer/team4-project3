import { Marker, useMapEvents } from "react-leaflet";
import { icon } from "leaflet";
import { useState } from "react";
import { PetRow, ReportRow } from "../services/apiPets";
import useFetchMapData from "@/hooks/useFetchMapData";
import { LoaderIcon } from "react-hot-toast";
type MarkerPainterProps = {
  handleMapClick: (p: PetRow | ReportRow) => void;
};

export default function MarkerPainter({ handleMapClick }: MarkerPainterProps) {
  const [triggerRefetch, setTriggerRefetch] = useState<number>(0);

  const map = useMapEvents({
    moveend: () => {
      setTriggerRefetch((prev) => prev + 1);
    },
  });
  const {
    pets: inViewPets,
    reports: inViewReports,
    error,
    isLoading,
  } = useFetchMapData(map, triggerRefetch);

  if (error) return <p>Error occurred fetching pets: {error.message}</p>;
  if (isLoading) return <LoaderIcon />;

  return (
    <>
      {inViewPets.map((pet) => {
        const markerIcon = icon({
          iconUrl: `/${pet.petType}${pet.caseStatus == "open" ? "" : "_unverified"}.png`,
          iconSize: [40, 40],
          iconAnchor: [0, 15],
        });
        if (!pet["position__latitude"] || !pet["position__longitude"]) {
          return null;
        }
        return (
          <Marker
            icon={markerIcon}
            key={
              pet.position__latitude + pet.position__longitude + Math.random()
            }
            position={[pet.position__latitude, pet.position__longitude]}
            title={pet.name}
            eventHandlers={{
              click: () => {
                if (!pet["position__latitude"] || !pet["position__longitude"]) {
                  return null;
                }
                handleMapClick(pet);
                map.setView(
                  [pet.position__latitude, pet.position__longitude],
                  14,
                );
              },
            }}
          ></Marker>
        );
      })}
      {inViewReports.map((report) => {
        const markerIcon = icon({
          iconUrl: `/${report.petType}${report.isCaseReviewed ? "" : "_unverified"}.png`,
          iconSize: [40, 40],
          iconAnchor: [0, 15],
        });
        if (report.reportLatitude && report.reportLongitude)
          return (
            <Marker
              icon={markerIcon}
              key={
                report.reportLatitude + report.reportLongitude + Math.random()
              }
              position={[report.reportLatitude, report.reportLongitude]}
              title={report.name}
              eventHandlers={{
                click: () => {
                  handleMapClick(report as ReportRow);
                  map.setView(
                    [
                      report.reportLatitude as number,
                      report.reportLongitude as number,
                    ],
                    14,
                  );
                },
              }}
            ></Marker>
          );
      })}
    </>
  );
}
