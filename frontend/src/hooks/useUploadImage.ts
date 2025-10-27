import { API_URL } from "@/utils/helpers";
import { useMutation } from "@tanstack/react-query";
import toast from "react-hot-toast";

export function useUploadImage() {
  return useMutation({
    mutationFn: async (file: File) => {
      const formData = new FormData();
      formData.append("file", file);

      const response = await fetch(`${API_URL}/api/upload`, {
        method: "POST",
        body: formData,
      });

      if (!response.ok) {
        const error = await response.json();
        toast.error(error.error || "Failed to upload image");
        throw new Error(error.error || "Failed to upload image");
      }

      const data = await response.json();
      toast.success("Image upload successful!");
      return data.url as string;
    },
  });
}
