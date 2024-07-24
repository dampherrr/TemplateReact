import React, { createContext, useContext } from "react";

const StarContext = createContext();

export const useStarContext = () => {
  return useContext(StarContext);
};

const StarProvider = ({ children }) => {
  return <StarContext.Provider value={{}}>{children}</StarContext.Provider>;
};

export default StarProvider;
