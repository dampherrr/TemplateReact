import React from "react";
import { Outlet } from "react-router-dom";

import "./App.css";

import StarProvider from "./context/StarContext";
import Stars from "./components/Stars";
import "./styles/stars.scss";

import NavBarProvider from "./context/NavBarContext";
import NavBar from "./pages/NavBar";
import "./styles/navbar.scss";

function App() {
  return (
    <StarProvider>
      <NavBarProvider>
        <Stars />
        <NavBar />
        <Outlet />
      </NavBarProvider>
    </StarProvider>
  );
}

export default App;
