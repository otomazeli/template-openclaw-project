// Example Encore service
import { api } from "encore.dev";

export const example = api({
  methods: { GET: "/hello" },
  handler: async (req) => {
    return { message: "Hello, world!" };
  },
});
