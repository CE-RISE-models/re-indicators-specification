# CE-RISE RE-Indicators Specification Data Model

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17610026.svg)](https://doi.org/10.5281/zenodo.17610026) [![Schemas](https://img.shields.io/badge/Schema%20Files-LinkML%2C%20JSON%2C%20SHACL%2C%20OWL-32CD32)](https://ce-rise-models.codeberg.page/re-indicators-specification/)


This repository provides the data model specifying the RE-indicators in the CE-RISE project.


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
Defines the concrete parameters and questions for each indicator **per product type**:

```yaml
# Example: REcycle indicator for PV panels
REcycle_PV:
  Parameters (specific to PV panels):
    - Documentation availability (4 questions)
    - Material composition (3 questions)
    - Depollution (5 questions)
    - Dismantling (3 questions)
    - Recyclability rate (2 questions)
    - Take-back scheme - bonus (2 questions)
  
  Total: 19 questions with answer options (score 0-5)
  
  Questions per parameter example:
    Documentation:
      - Q1.1: Unique Product identifier (weight: 0.05)
      - Q1.2: Bill of materials (weight: 0.45)
      - Q1.3: Safety manual (weight: 0.25)
      - Q1.4: Disassembly manual (weight: 0.25)

# Note: Other products (Battery, Laptop, Printer, HVAC) will have 
# different parameters, questions, and scoring for their REcycle indicator
```

### 3. Product Configurations Layer
Specifies how indicators apply to specific products:

```yaml
REcycle for all products:
  - Uses the same 6 parameters with 19 questions total
  - Same scoring structure (0-5) for all answer options
  - Product type is tracked but does not affect scoring or questions
  - All products assessed identically using the same indicator structure
```

### Key Design Principles

1. **Product-Specific Indicators**: Each product type has its own set of parameters and questions for each indicator
2. **Independent Specifications**: REcycle for PV is completely different from REcycle for Battery, Laptop, etc.
3. **Variable Structure**: Each product can have different parameters, questions, answer options, and scoring
4. **Version Lock**: Git tags (e.g., v1.0.0) lock the complete specification for all products

### Data Properties

Each class has a corresponding value property (e.g., `name_value`, `company_id_value`) that holds the actual data. All value properties are string type except where specified otherwise.

#### SQL Identifiers

Every data point in the model includes a `sql_identifier` annotation that serves as a unique, machine-friendly database identifier. These identifiers follow a structured namespace pattern to ensure uniqueness across the entire data model:

**Pattern**: `reind_[indicator]_[category]_[specific_name]`

This identifier system enables seamless integration with databases and ensures clear data model composition when combining with other CE-RISE data models.


---

## Development Roadmap

### RE Indicators Status

The CE-RISE project defines 5 core Resource Efficiency indicators:

| Indicator | Status | Products | Parameters Defined | Questions Defined |
|-----------|--------|----------|-------------------|-------------------|
| **REcycle** | PV Complete, Others Not Started | PV (complete), Battery, Laptop, Printer, HVAC | PV: 6/6 | PV: 19/19 (all with answer options) |
| **REuse** | Not started | Laptop, Printer | 0 | 0 |
| **REpair** | Not started | Laptop, Printer, HVAC | 0 | 0 |
| **REmanufacture** | Not started | Laptop, Printer | 0 | 0 |
| **REfurbish** | Not started | Laptop, Printer | 0 | 0 |

### Current Implementation Status

#### Completed
- Core meta-model with abstract classes for indicators, parameters, questions, and assessments
- REcycle indicator for PV panels fully implemented with 6 parameters:
  - Documentation availability (4 questions)
  - Material composition (3 questions)
  - Depollution (5 questions)
  - Dismantling (3 questions)
  - Recyclability rate (2 questions)
  - Take-back scheme - Bonus (2 questions)
- All 19 questions for PV REcycle defined with complete answer options and scoring (0-5 scale)
- JSON Schema and SHACL generation working
- Scoring structure preserved with proper data types

#### TODO
- REcycle indicator for Battery (completely different from PV)
- REcycle indicator for Laptop (completely different from PV)
- REcycle indicator for Printer (completely different from PV)
- REcycle indicator for HVAC (completely different from PV)
- REuse indicator specification
- REpair indicator specification  
- REmanufacture indicator specification
- REfurbish indicator specification
- Sample assessment data
- Validation tests for all indicators
- OWL export optimization

### Next Steps
1. Define REcycle indicator specifications for Battery, Laptop, Printer, and HVAC (each with their own parameters and questions)
2. Define REuse indicator parameters and questions for Laptop and Printer
3. Define REpair indicator parameters and questions for Laptop, Printer, and HVAC
4. Define REmanufacture indicator for Laptop and Printer
5. Define REfurbish indicator for Laptop and Printer
6. Create sample assessments for validation
7. Implement validation test suite

---

## Publishing

Release artifacts for each version (`schema.json`, `shacl.ttl`, `model.owl`)  
are served directly from this URL:
```
https://ce-rise-models.codeberg.page/re-indicators-specification/
```

---

## Accessing Previous Releases

If you want to view the files published for version `v1.2.0`, open:

https://codeberg.org/CE-RISE-models/re-indicators-specification/src/tag/pages-v1.2.0/generated/

Files available in that directory typically include:

- schema.yaml
- schema.json
- shacl.ttl
- model.ttl
- index.html

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
