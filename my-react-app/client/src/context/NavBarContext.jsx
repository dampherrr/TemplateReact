import React, { createContext, useContext } from "react";

const NavBarContext = createContext();

export const useNavBarContext = () => {
  return useContext(NavBarContext);
};

const NavBarProvider = ({ children }) => {
  return <NavBarContext.Provider value={{}}>{children}</NavBarContext.Provider>;
};

export default NavBarProvider;
