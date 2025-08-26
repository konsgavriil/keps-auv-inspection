# Plan Verbalisation for Robots Acting in Dynamic Environments

This repository contains the **planning models and ontology** used in the paper:  

> **K. Gavriilidis, Y. Carreno, A. Munafo, W. Pang, R. P. A. Petrick, and H. Hastie**  
> *Plan Verbalisation for Robots Acting in Dynamic Environments*  
> ICAPS 2021 Workshop on Knowledge Engineering for Planning and Scheduling (KEPS).  
> [[Paper Link]](https://www.research.ed.ac.uk/en/publications/22e6b834-f31b-4755-a27a-d169d86cacd7)

---

## Overview

The work introduces a **plan verbalisation framework** for autonomous systems operating in dynamic environments. Using **PDDL models** and an **OWL ontology**, the framework enables robots to explain their plans, execution progress, and replanning behaviour in **natural language**, improving operator transparency and trust.  

This repository provides:
- The **PDDL domain** and **problem files** for the **Autonomous Underwater Vehicle (AUV) inspection domain**.  
- The **ontology** used to support reasoning about robot capabilities, environment features, and action preconditions/effects.  

---

## Contents

```
├── aip00.pddl # Example PDDL problem instance
├── auv_inspection_domain.pddl # PDDL domain definition (AUV inspection domain with temporal actions)
├── auv_ontology.owl # OWL ontology representing domain knowledge
└── README.md # This file
```

---

## Domain Description

The **AUV inspection domain** models tasks such as:
- Navigation and structure mapping  
- Valve manipulation using a robotic arm  
- Rock inspection for soil analysis  
- Communication, recharging, hardware repair, and recovery  

The domain includes **temporal actions** with explicit preconditions and effects, supporting execution monitoring and replanning.  

---

## Ontology

The **OWL ontology** mirrors the PDDL domain by encoding:
- **Entities** (e.g., robot, waypoints, structures)  
- **Capabilities and equipment** (e.g., sonar, manipulator arm, rock analyser)  
- **Relations and constraints** (e.g., connected points, distances, battery levels)  

This ontology enables reasoning over robot states and supports natural language plan verbalisation.  

---

## Usage

1. Use the provided **PDDL domain and problem files** with a temporal planner such as [OPTIC](https://nms.kcl.ac.uk/planning/software/optic.html).  
2. Load the **ontology** with [Owlready2](https://owlready2.readthedocs.io/) or a reasoner like HermiT to support inference and explanation.  

---

## Citation

If you use this repository, please cite our paper:

```bibtex
@inproceedings{gavriilidis2021plan,
  title={Plan Verbalisation for Robots Acting in Dynamic Environments},
  author={Gavriilidis, Konstantinos and Carreno, Yaniel and Munafo, Andrea and Pang, Wei and Petrick, Ronald P.A. and Hastie, Helen},
  booktitle={ICAPS Workshop on Knowledge Engineering for Planning and Scheduling (KEPS)},
  year={2021}
}
```

---

## Acknowledgements

This work was funded and supported by:  
- **EPSRC ORCA Hub (EP/R026173/1)**  
- **UKRI Node on Trust (EP/V026682/1)**  
- **EPSRC CDT in Robotics and Autonomous Systems (EP/S023208/1)**  
- **SeeByte Ltd**  
- **SRPe**
