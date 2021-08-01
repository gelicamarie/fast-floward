import * as fcl from "@onflow/fcl";
import React from "react";
import ReactDOM from "react-dom";
import "./index.css";
import App from "./App.jsx";

// Configure FCL for Flow testnet.
fcl
  .config()
  .put("accessNode.api", "https://access-testnet.onflow.org") //testnet
  .put("discovery.wallet", "https://fcl-discovery.onflow.org/testnet/authn"); //testnet wallet service

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById("root")
);
