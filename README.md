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

### 2. Core Parameter Libraries (`model/indicators/*_core.yaml`)
Centralized definitions of reusable parameters, questions, and answer options:

```yaml
# Example: REcycle_core.yaml
Documentation_Parameter:
  id: P1_documentation
  name: Documentation availability
  questions:
    - Q1.1: Unique Product identifier (weight: 0.05)
    - Q1.2: Bill of materials (weight: 0.45)
    - Q1.3: Safety manual (weight: 0.25)
    - Q1.4: Disassembly manual (weight: 0.25)
  answer_options:
    - Publicly available (score: 5.0)
    - Available to independent recyclers (score: 4.0)
    - Available to authorized recyclers (score: 3.0)
    - Available to manufacturers only (score: 1.0)
    - Not available (score: 0.0)

# All 6 REcycle parameters defined once and reused across products
```

### 3. Product Configuration Layer (`model/indicators/*_ProductName.yaml`)
Product-specific configurations that reference shared parameters with custom weights:

```yaml
# Example: REcycle_PV.yaml
REcycle_PV_Config:
  product_category: PV
  parameter_applications:
    - parameter_ref: P1_documentation
      weight: 0.1
    - parameter_ref: P2_material_composition
      weight: 0.3
    - parameter_ref: P3_depollution
      weight: 0.1
    - parameter_ref: P4_dismantling
      weight: 0.1
    - parameter_ref: P5_recyclability_rate
      weight: 0.4
    - parameter_ref: P6_takeback_scheme
      weight: 0.1

# REcycle_Printer.yaml uses the same parameters with different weights
```

### Key Design Principles

1. **Core Parameter Libraries**: Common parameters, questions, and answer options are defined once and reused across products
2. **Product-Specific Weights**: Each product references shared parameters but can customize their relative importance (weights)
3. **Namespace Isolation**: Centralized parameter definitions eliminate naming conflicts between products
4. **DRY Architecture**: Questions and scoring are maintained in a single location, reducing duplication and maintenance
5. **Version Lock**: Git tags (e.g., v1.0.0) lock both shared parameter definitions and product configurations
6. **Normalized Scoring**: All indicator final scores range from 0 to 1, where 1 represents the highest/best score (most recyclable, reusable, etc.) and 0 represents the lowest/worst score

### Data Properties

Each class has a corresponding value property (e.g., `name_value`, `company_id_value`) that holds the actual data. All value properties are string type except where specified otherwise.

#### SQL Identifiers

Every data point in the model includes a `sql_identifier` annotation that serves as a unique, machine-friendly database identifier. These identifiers follow a structured namespace pattern to ensure uniqueness across the entire data model:

**Pattern**: `reind_[indicator]_[category]_[specific_name]`

This identifier system enables seamless integration with databases and ensures clear data model composition when combining with other CE-RISE data models.


---

## Development Roadmap

### RE Indicators Status

The CE-RISE project defines 5 core Resource Efficiency indicators with specific product applicability:

| Indicator | Status | Relevant Product Groups | Progress |
|-----------|--------|------------------------|----------|
| **REcycle** | ✅ Complete | PV, Battery, Heatpump, Laptop, Printer | All 5 products complete with product-specific parameters |
| **REuse** | ✅ Complete | Laptop, Printer | All 2 products complete with shared core parameters |
| **REpair** | ✅ Complete | Laptop | 1/1 product complete |
| **REmanufacture** | Not started | Laptop, Printer | 0/2 products |
| **REfurbish** | Not started | Laptop, Printer | 0/2 products |

**Total Scope**: 12 indicator-product combinations (8 complete, 4 remaining)

### Current Implementation Status

#### ✅ Completed - REcycle Indicator (5/5 products)

#### ✅ Completed - REuse Indicator (2/2 products)

#### ✅ Completed - REpair Indicator (1/1 products)

#### 📋 TODO - Other Indicators

- [ ] REmanufacture indicator for Laptop
- [ ] REmanufacture indicator for Printer
- [ ] REfurbish indicator for Laptop
- [ ] REfurbish indicator for Printer

#### 📋 TODO - Testing & Documentation
- [ ] Sample assessment data for each indicator-product combination
- [ ] Validation tests for all indicators
- [ ] OWL export optimization

### Next Steps
1. ✅ Define REuse indicator parameters and questions for Laptop and Printer - COMPLETE
2. ✅ Define REpair indicator parameters and questions for Laptop - COMPLETE
3. Define REmanufacture indicator for Laptop and Printer
4. Define REfurbish indicator for Laptop and Printer
5. Create sample assessments for validation
6. Implement validation test suite

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
