# CE-RISE RE-Indicators Specification Data Model

This repository provides the data model specifying the RE-indicators in the CE-RISE project.

---

## Repository structure

```
/
├─ model/              # LinkML source files (.yaml)
│  ├─ model.yaml      # Core meta-model with abstract classes
│  └─ indicators/     # Concrete indicator specifications
│     └─ REcycle.yaml # Recyclability specifications for all products
├─ mappings/          # SSSOM and JSON-LD mappings  
├─ generated/         # auto-generated JSON Schema, SHACL, OWL
├─ samples/           # example data instances
├─ tests/             # validation tests
└─ README.md
```

---

## Data Model Structure

The CE-RISE RE-Indicators data model implements a three-layer architecture for maximum reusability and clear versioning:

### 1. Core Model Layer (`model/model.yaml`)
Defines abstract classes that form the foundation:
- **Indicators**: The 5 RE indicators (REcycle, REuse, REpair, REmanufacture, REfurbish)
- **Parameters**: Scoreable components within indicators (e.g., Documentation availability)
- **Questions**: Individual assessment questions with weights
- **Assessments**: Structure for recording actual product evaluations

### 2. Indicator Specifications Layer (`model/indicators/`)
Defines the concrete parameters and questions for each indicator:

```yaml
# Example: REcycle indicator structure
REcycle:
  Parameters (same for all products):
    - Documentation availability
    - Material composition  
    - Depollution
    - Dismantling
    - Recyclability rate
    - Take-back scheme (bonus)
  
  Questions per parameter (same for all products using that parameter):
    Documentation:
      - Q1.1: Unique Product identifier (weight: 0.05)
      - Q1.2: Bill of materials (weight: 0.45)
      - Q1.3: Safety manual (weight: 0.25)
      - Q1.4: Disassembly manual (weight: 0.25)
```

### 3. Product Configurations Layer
Specifies how indicators apply to specific products:

```yaml
REcycle for PV (v1.0):
  - Documentation (weight: 0.1) → uses Q1.1, Q1.2, Q1.3, Q1.4
  - Material composition (weight: 0.3) → uses its defined questions
  - Depollution (weight: 0.1) → uses its defined questions
  - Dismantling (weight: 0.1) → uses its defined questions
  - Recyclability rate (weight: 0.4) → uses its defined questions
  - Take-back scheme (weight: 0.1) → uses its defined questions

REcycle for Battery (v1.0):
  - Documentation (weight: 0.15) → uses Q1.1, Q1.2, Q1.3, Q1.4
  - Material composition (weight: 0.35) → uses its defined questions
  - Depollution (weight: 0.2) → uses its defined questions
  - Recyclability rate (weight: 0.25) → uses its defined questions
  - Take-back scheme (weight: 0.05) → uses its defined questions
  # Note: Dismantling not included for batteries
```

### Key Design Principles

1. **Fixed Structure**: Indicators and parameters are always the same
2. **Shared Questions**: All products using a parameter get the same questions
3. **Variable Weights**: Each product can assign different weights to parameters
4. **Optional Parameters**: Products can exclude parameters (e.g., Battery excludes Dismantling)
5. **Version Lock**: Git tags (e.g., v1.0.0) lock the complete specification

### How Versioning Works

When you tag the repository (e.g., `git tag v1.0.0`), you lock:
- The exact questions for each parameter
- The weights for each product-parameter combination
- The complete indicator specifications

This ensures that assessments can reference a specific version and get reproducible results.

---

## Development Roadmap

### RE Indicators Status

The CE-RISE project defines 5 core Resource Efficiency indicators:

| Indicator | Status | Products | Parameters Defined | Questions Defined |
|-----------|--------|----------|-------------------|-------------------|
| **REcycle** | Partial | PV (complete), Battery (not started) | 6/6 (placeholders) | Documentation only |
| **REuse** | Not started | Laptop, Printer | 0 | 0 |
| **REpair** | Not started | Laptop, Printer, HVAC | 0 | 0 |
| **REmanufacture** | Not started | Laptop, Printer | 0 | 0 |
| **REfurbish** | Not started | Laptop, Printer | 0 | 0 |

### Current Implementation Status

#### Completed
- Core meta-model with abstract classes
- REcycle indicator structure with 6 parameters defined
- Documentation parameter fully implemented with 4 questions and answer options
- Product-specific application for PV with weights

#### In Progress
- Questions and answers for remaining 5 REcycle parameters (Material Composition, Depollution, Dismantling, Recyclability Rate, Take-back Scheme)
- Battery product specification for REcycle
- Additional products for REcycle (Laptop, Printer, HVAC)

#### TODO
- REuse indicator specification
- REpair indicator specification  
- REmanufacture indicator specification
- REfurbish indicator specification
- Validation tests for all indicators
- Sample assessment data
- JSON Schema generation
- SHACL/OWL exports

### Next Steps
1. Define questions and answers for the 5 remaining REcycle parameters
2. Complete Battery specification for REcycle
3. Add remaining products for REcycle (Laptop, Printer, HVAC)
4. Define REuse parameters and questions
5. Define REpair parameters and questions
6. Define REmanufacture and REfurbish specifications
7. Create sample assessments for validation

---

## Publishing

Release artifacts for each version (`schema.json`, `shacl.ttl`, `model.owl`)  
are served directly from this URL:
```
https://ce-rise-models.codeberg.page/re-indicators-specification/
```

---

## Versioning

Follow [Semantic Versioning](https://semver.org/):

```bash
git tag -a v1.0.0 -m "First release"
git push origin v1.0.0
```

Each tag corresponds to a published release of the model.

---
<a href="https://europa.eu" target="_blank" rel="noopener noreferrer">
  <img src="https://ce-rise.eu/wp-content/uploads/2023/01/EN-Funded-by-the-EU-PANTONE-e1663585234561-1-1.png" alt="EU emblem" width="200"/>
</a>

Funded by the European Union under Grant Agreement No. 101092281 — CE-RISE.  
Views and opinions expressed are those of the author(s) only and do not necessarily reflect those of the European Union or the granting authority (HADEA).  
Neither the European Union nor the granting authority can be held responsible for them.

© 2025 CE-RISE consortium.  
Licensed under [Creative Commons Attribution–NonCommercial 4.0 International (CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/).  
Attribution: CE-RISE project (Grant Agreement No. 101092281) and the individual authors/partners as indicated.

<a href="https://www.empa.cch" target="_blank" rel="noopener noreferrer">
  <img src="https://www.empa.ch/image/company_logo?img_id=31464838&t=1762532293211" alt="EMPA logo" height="30"/>
</a>
<a href="https://www.nilu.com" target="_blank" rel="noopener noreferrer">
  <img src="https://nilu.no/wp-content/uploads/2023/12/nilu-logo-seagreen-rgb-300px.png" alt="NILU logo" height="20"/>
</a>

Developed by EMPA and NILU (Riccardo Boero — ribo@nilu.no) within the CE-RISE project.
