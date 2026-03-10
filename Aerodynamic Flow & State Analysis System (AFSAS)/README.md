# Aerodynamic Flow & State Analysis System (AFSAS)

A modular computational engine developed in MATLAB to analyze and visualize isentropic flow relationships and thermodynamic state changes for high-speed aerodynamic streamlines.

## 🚀 Overview
AFSAS is designed to automate the complex calculations involved in airfoil analysis. By inputting initial velocity and pressure conditions, the system solves for varying temperature and velocity states using iterative logic and energy conservation principles.

## 🔬 Engineering Foundations
The system is built upon three core physical pillars:
* **Ideal Gas Law: used for initial state characterization.
* **Isentropic Relations: for reversible adiabatic flow analysis.
* **Energy Conservation: to derive resulting flow velocities.

## 🏗️ Modular Architecture
This project follows a "Systems Engineering" approach by decoupling logic into specialized functional modules:
* `More_Functions_Subfunctions.m`: The main driver script.
* `inputs.m`: Centralized parameter and constant initialization.
* `Ideal_gas_law.m`: State 1 temperature solver.
* `Isentropic.m`: Iterative temperature ratio calculator.
* `velocity.m`: Kinetic energy and velocity solver.
* `plot_vel_press.m`: Automated data visualization and plotting.

## 📈 Visual Output

The system generates a multi-pane comparative analysis showing:
1. **Pressure vs. Velocity:** Visualizing Bernoulli-type relationships.
2. **Temperature vs. Pressure:** Correlating thermal state changes.
3. **Velocity vs. Temperature:** Mapping the kinetic-thermal energy exchange.

## 🛠️ Installation & Usage
1. Clone the repository: `git clone https://github.com/eng-amine/engineering-computation-matlab.git`
2. Open MATLAB and navigate to the project directory.
3. Run `More_Functions_Subfunctions.m`.
4. Enter the initial velocity (m/s) when prompted by the CLI.

---
**Author:** Eng-Amine  
**Focus:** Mechanical Engineering & Computational Analysis
