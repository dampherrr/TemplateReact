import React from "react";
import { createRoot } from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";

import App from "./App";
import About from "./pages/About";
import Projects from "./pages/Projects";
import News from "./pages/News";
import Contact from "./pages/Contact";

import StarProvider from "./context/StarContext";
import Stars from "./components/Stars";
import "./styles/stars.scss";

const router = createBrowserRouter([
  {
    path: "/",
    element: <App />,
  },
  { path: "/About", element: <About /> },
  { path: "/Projects", element: <Projects /> },
  { path: "/News", element: <News /> },
  { path: "/Contact", element: <Contact /> },
]);

const rootElement = document.getElementById("root");
const root = createRoot(rootElement);

root.render(
  <React.StrictMode>
    <StarProvider>
      <Stars />
      <RouterProvider router={router} />
    </StarProvider>
  </React.StrictMode>
);
