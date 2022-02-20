import axios from "axios";
import data from "./data.json"

const apiClient = {
  async list() {
    const response = await axios.get("/recipes", {
      headers: {
        'Access-Control-Allow-Origin' : '*',
        "Access-Control-Allow-Credentials" : "true",
        "Access-Control-Allow-Headers" : "Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers",
        'Access-Control-Allow-Methods':'GET,PUT,POST,DELETE,PATCH,OPTIONS',
      },
    });
    return response.data;
  },

  getRecipes() {
    return data
  }
};

export default apiClient;
