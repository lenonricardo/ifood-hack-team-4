import axios from "axios";

const apiClient = {
  async list() {
    const response = await axios.get("/recipes", {
      headers: {
        'Access-Control-Allow-Origin' : '*',
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE,PATCH,OPTIONS',
      },
    });
    return response.data;
  },
};

export default apiClient;
