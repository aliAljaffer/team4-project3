import { z } from "zod";
import { LatLngExpression } from "leaflet";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { TPet } from "./Pet";
import { CheckIcon } from "@radix-ui/react-icons";
import { useGeolocation } from "@/hooks/useGeolocation";
import { Button } from "../ui/button";
import { useEffect, useState } from "react";
import toast from "react-hot-toast";
import { submitPetOrReport } from "../services/apiPets";
import { useUploadImage } from "@/hooks/useUploadImage";
import { useQueryClient } from "@tanstack/react-query";

type MakeReportProps = {
  petReported?: TPet;
  action?: () => void;
};
export type FormData = z.infer<typeof formSchema> & {
  image: File | null;
};

export default function MakeReport({ petReported, action }: MakeReportProps) {
  const isReportingPetAsFound = petReported !== undefined;
  const autoFilled = <CheckIcon className="absolute right-2 top-0" />;
  const { getPosition, position: userPosition } = useGeolocation();
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const {
    register,
    handleSubmit,
    formState: { errors },
    setValue,
  } = useForm<FormData>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      image: null,
      breed: isReportingPetAsFound ? petReported.breed : "",
      caseStatus: "open",
      contact: "",
      description: "",
      hasMicrochip: isReportingPetAsFound
        ? petReported.microchip__microchipNumber || undefined
        : false,
      isLost: isReportingPetAsFound ? petReported.isLost : false,
      language: "ar",
      message: "",
      petName: isReportingPetAsFound ? petReported.name : "",
      petType: isReportingPetAsFound ? petReported.petType : "dog",
      position: undefined,
      reportDate: new Date().toISOString(),
      reporterName: "",
      reward: isReportingPetAsFound ? petReported.reward + "" : "",
      tags: [""],
    },
  });
  const uploadImage = useUploadImage();
  const queryClient = useQueryClient();
  useEffect(() => {
    if (userPosition) {
      let lat, lng;
      if (Array.isArray(userPosition)) {
        lat = userPosition[0];
        lng = userPosition[1];
      } else if (userPosition) {
        lat = userPosition.lat;
        lng = userPosition.lng;
      }

      // Update the 'position' field in the form with lat, lng
      if (lat && lng) {
        setValue("position", [lat, lng]);
      }
    }
  }, [userPosition, setValue]);
  const onSubmit = async (data: FormData) => {
    setIsLoading(true);
    let url: string | null = "None";
    if (data.imageUrl) {
      url = await uploadImage.mutateAsync(data.imageUrl);
    }
    let lat, lng;
    if (Array.isArray(userPosition)) {
      lat = userPosition[0];
      lng = userPosition[1];
    } else if (userPosition) {
      lat = userPosition.lat;
      lng = userPosition.lng;
    }
    // If reporting a LOST pet, create a new pet entry
    if (!isReportingPetAsFound) {
      const petRow = {
        name: data.petName,
        petType: data.petType,
        contact: data.contact,
        isLost: true,
        caseStatus: "open" as const,
        position__latitude: lat,
        position__longitude: lng,
        imageUrl: url,
        description: data.description,
        message: data.message,
        reporterName: data.reporterName,
        reward: data.reward,
        breed: data.breed,
        language: data.language,
        reportDate: data.reportDate,
        microchip__hasMicrochip: !!data.hasMicrochip,
        microchip__microchipNumber: data.hasMicrochip || "",
        tags: data?.tags?.join(", ") || "",
      };

      const res = await submitPetOrReport({
        isReportingPetAsFound: false,
        data: petRow,
        queryClient,
      });

      if (!res.ok) {
        toast.error("Error occurred. ", res);
        action?.();
      } else {
        toast.success("Lost pet report submitted!");
        action?.();
      }
    } else {
      const reportRow = {
        name: data.reporterName,
        petType: petReported?.petType || data.petType,
        contact: data.contact,
        isPetFoundReport: true,
        reportLatitude: lat,
        reportLongitude: lng,
        imageUrl: url,
        message: data.message,
        isCaseReviewed: false,
        language: data.language,
        caseId:
          petReported?.caseId || (data.caseId ? parseInt(data.caseId) : null),
      };

      const res = await submitPetOrReport({
        isReportingPetAsFound: true,
        data: reportRow,
        queryClient,
      });

      if (!res.ok) {
        toast.error("Error occurred. ", res);
        action?.();
      } else {
        toast.success("Found pet report submitted!");
        action?.();
      }
    }
    setIsLoading(false);
  };

  return (
    <div className="h-full w-full text-xs">
      <form
        onSubmit={handleSubmit(onSubmit)}
        className="mx-auto max-w-md space-y-2 rounded-lg bg-white p-1 shadow-md"
      >
        {/* Case ID - only shows when reporting found pet without petReported */}
        {isReportingPetAsFound && !petReported && (
          <div>
            <label className="block text-sm font-medium text-gray-700">
              Case ID{" "}
              <span className="ml-1 text-xs">(Optional - if you know it)</span>
            </label>
            <input
              type="text"
              {...register("caseId")}
              placeholder="Enter case ID if known"
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            />
            {errors.caseId && (
              <span className="text-sm text-red-600">
                {errors.caseId.message}
              </span>
            )}
          </div>
        )}
        {/* Pet Name */}
        {!isReportingPetAsFound && (
          <div className="relative">
            <label className="block text-sm font-medium text-gray-700">
              Pet Name{" "}
              <span className="ml-1 text-xs">
                (use 'unknown' if not available)
              </span>
            </label>
            <input
              disabled={isReportingPetAsFound}
              type="text"
              {...register("petName")}
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            />
            {isReportingPetAsFound && autoFilled}
            {errors.petName && (
              <span className="text-sm text-red-600">
                {errors.petName.message}
              </span>
            )}
          </div>
        )}
        {/* Pet Type (Select) */}
        {!isReportingPetAsFound && (
          <div className="relative">
            <label className="block text-sm font-medium text-gray-700">
              Pet Type
            </label>
            <select
              disabled={isReportingPetAsFound}
              {...register("petType")}
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            >
              <option value="dog">Dog</option>
              <option value="cat">Cat</option>
            </select>
            {isReportingPetAsFound && autoFilled}
            {errors.petType && (
              <span className="text-sm text-red-600">
                {errors.petType.message}
              </span>
            )}
          </div>
        )}
        {/* Contact */}
        <div>
          <label className="block text-sm font-medium text-gray-700">
            Contact <span className="ml-1 text-xs">(Phone Number/Email)</span>
          </label>
          <input
            type="text"
            {...register("contact")}
            className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
          />
          {errors.contact && (
            <span className="text-sm text-red-600">
              {errors.contact.message}
            </span>
          )}
        </div>
        {/* Is Lost (Checkbox) */}
        {!isReportingPetAsFound && (
          <div className="relative flex items-center">
            <input
              disabled={isReportingPetAsFound}
              type="checkbox"
              {...register("isLost")}
              className="mr-2 h-4 w-4 rounded border-gray-300 text-neutral-600 focus:ring-neutral-500"
            />
            <label className="text-sm font-medium text-gray-700">
              Did you find this pet?
            </label>
            {isReportingPetAsFound && autoFilled}
          </div>
        )}
        {/* Position */}
        {!isReportingPetAsFound && (
          <div className="relative">
            <label className="block text-sm font-medium text-gray-700">
              Position (LatLngExpression)
            </label>
            {!userPosition && (
              <Button
                variant={"outline"}
                size={"sm"}
                className="absolute bottom-0.5 right-0"
                onClick={() => getPosition(true)}
              >
                Get my position
              </Button>
            )}
            <input
              type="text"
              // {...register("position")}
              placeholder="Your position"
              value={
                userPosition
                  ? Array.isArray(userPosition)
                    ? `${userPosition[0]}, ${userPosition[1]}`
                    : `${userPosition.lat}, ${userPosition.lng}`
                  : ""
              }
              disabled
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            />
            {isReportingPetAsFound && autoFilled}
            {errors.position && (
              <span className="text-sm text-red-600">
                {errors.position.message}
              </span>
            )}
          </div>
        )}
        {/* Image */}
        {!isReportingPetAsFound && (
          <div className="relative">
            <label className="block text-sm font-medium text-gray-700">
              Pet photo
            </label>
            <input
              disabled={isReportingPetAsFound}
              type="file"
              accept="image/*"
              {...register("imageUrl")}
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            />
            {isReportingPetAsFound && autoFilled}
            {errors.imageUrl && (
              <span className="text-sm text-red-600">
                {errors.imageUrl.message}
              </span>
            )}
          </div>
        )}
        {/* Reporter Name */}
        <div>
          <label className="block text-sm font-medium text-gray-700">
            Your Name
          </label>
          <input
            type="text"
            {...register("reporterName")}
            className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
          />
          {errors.reporterName && (
            <span className="text-sm text-red-600">
              {errors.reporterName.message}
            </span>
          )}
        </div>
        {/* Reward */}
        {!isReportingPetAsFound && (
          <div className="relative">
            <label className="block text-sm font-medium text-gray-700">
              Reward{" "}
              <span className="ml-1 text-xs">
                (In case of reporting a lost pet)
              </span>
            </label>
            <input
              disabled={isReportingPetAsFound}
              type="number"
              onWheel={(e) => {
                e.currentTarget.blur();
              }}
              {...register("reward")}
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            />
            {isReportingPetAsFound && autoFilled}
            {errors.reward && (
              <span className="text-sm text-red-600">
                {errors.reward.message}
              </span>
            )}
          </div>
        )}
        {/* Language (Select) */}
        <div>
          <label className="block text-sm font-medium text-gray-700">
            Language
          </label>
          <select
            {...register("language")}
            className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
          >
            <option value="ar">Arabic</option>
            <option value="en">English</option>
            <option value="fr">French</option>
            <option value="ja">Japanese</option>
            <option value="ru">Russian</option>
            <option value="it">Italian</option>
            <option value="zh">Chinese</option>
            <option value="hi">Hindi</option>
            <option value="es">Spanish</option>
            <option value="tr">Turkish</option>
            <option value="de">German</option>
            <option value="pt">Portuguese</option>
          </select>
          {errors.language && (
            <span className="text-sm text-red-600">
              {errors.language.message}
            </span>
          )}
        </div>
        {/* Report Date */}
        <div>
          <label className="block text-sm font-medium text-gray-700">
            Report Date
          </label>
          <input
            disabled={isReportingPetAsFound}
            type={isReportingPetAsFound ? "text" : "date"}
            {...register("reportDate")}
            className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
          />
          {errors.reportDate && (
            <span className="text-sm text-red-600">
              {errors.reportDate.message}
            </span>
          )}
        </div>
        {/* Has Microchip */}
        {!isReportingPetAsFound && (
          <div className="relative">
            <label className="block text-sm font-medium text-gray-700">
              Has Microchip
            </label>
            <input
              disabled={isReportingPetAsFound}
              type="number"
              {...register("hasMicrochip")}
              placeholder="Enter microchip number or 0"
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            />{" "}
            {isReportingPetAsFound && autoFilled}
            {errors.hasMicrochip && (
              <span className="text-sm text-red-600">
                {errors.hasMicrochip.message}
              </span>
            )}
          </div>
        )}
        {/* Description */}
        {!isReportingPetAsFound && (
          <div>
            <label className="block text-sm font-medium text-gray-700">
              Description of the pet{" "}
              <span className="ml-1 text-xs">(Optional)</span>
            </label>
            <textarea
              {...register("description")}
              rows={3}
              className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
            />
            {errors.description && (
              <span className="text-sm text-red-600">
                {errors.description.message}
              </span>
            )}
          </div>
        )}

        {/* Message */}
        <div>
          <label className="block text-sm font-medium text-gray-700">
            Message/Additional Info{" "}
            <span className="ml-1 text-xs">(Optional)</span>
          </label>
          <textarea
            {...register("message")}
            rows={3}
            className="mt-1 w-full rounded-md border border-gray-300 p-2 focus:outline-none focus:ring focus:ring-neutral-400"
          />
          {errors.message && (
            <span className="text-sm text-red-600">
              {errors.message.message}
            </span>
          )}
        </div>
        <div className="flex flex-row-reverse gap-1">
          {!userPosition && (
            <button
              type="button"
              onClick={() => getPosition(true)}
              className="mt-4 w-full rounded-md border border-red-700 bg-neutral-200 py-2 font-semibold text-zinc-700 hover:bg-neutral-700 focus:outline-none focus:ring-2 focus:ring-neutral-300"
            >
              Get my position
            </button>
          )}

          <button
            disabled={!userPosition || isLoading}
            type="submit"
            className="mt-4 w-full rounded-md bg-neutral-600 py-2 font-semibold text-white hover:bg-neutral-700 focus:outline-none focus:ring-2 focus:ring-neutral-300"
          >
            Submit
          </button>
        </div>
      </form>
    </div>
  );
}

const formSchema = z.object({
  caseId: z.string().optional(),
  petName: z
    .string()
    .min(1, "Pet name is required. Please use 'unknown' if not available."),
  petType: z.enum(["dog", "cat"]),
  contact: z.string().min(1, "Contact information is required"), // Validate phone or email separately if needed
  isLost: z.boolean(),
  caseStatus: z.enum(["open", "closed"]), // Specify allowed case statuses
  position: z.custom<LatLngExpression | null>(), // Validate LatLngExpression if necessary
  imageUrl: z
    .custom<FileList>()
    .transform((file) => (file?.length > 0 ? file.item(0) : null))
    .refine((file) => !file || file.size <= 10 * 1024 * 1024, {
      message: "The image must be a maximum of 10MB.",
    })
    .refine((file) => !file || file.type?.startsWith("image"), {
      message: "Only images are allowed to be sent.",
    })
    .nullable(),
  description: z.string().optional(),
  message: z.string().optional(),
  reporterName: z.string().min(1, "Reporter name is required"),
  reward: z.string(),
  breed: z.string().optional(),
  tags: z.array(z.string()).optional(),
  language: z.enum([
    "ar",
    "en",
    "fr",
    "ja",
    "ru",
    "it",
    "zh",
    "hi",
    "es",
    "tr",
    "de",
    "pt",
  ]),
  reportDate: z.string().refine((val) => !isNaN(Date.parse(val)), {
    message: "Invalid date format, must be ISO8601",
  }),
  hasMicrochip: z.union([z.string(), z.literal(false)]),
});

/*
caseId: number;
  petName: string;
  petType: "dog" | "cat"; // Specify allowed pet types
  contact: string; // Phone or email
  isLost: boolean;
  caseStatus: "open" | "closed"; // Specify allowed case statuses
  position: LatLngExpression;
  imageUrl: string;
  description: string;
  message: string;
  reporterName: string;
  reward: number;
  breed: string;
  tags: string[];
  language:
    | "ar"
    | "en"
    | "fr"
    | "ja"
    | "ru"
    | "it"
    | "zh"
    | "hi"
    | "es"
    | "tr"
    | "de"
    | "pt";
  reportDate: string; // ISO8601 date format
  hasMicrochip: number | false;
   */
