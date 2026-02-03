# Changelog

All notable changes to the CE-RISE RE-Indicators Specification Data Model will be documented in this file.

## [0.0.2] - Unreleased

### Added
- REcycle_core.yaml - Core parameter library with shared parameters (P1, P2, P3, P6)
- REcycle indicator complete for all 5 products:
  - REcycle_PV - PV-specific with 12 dismantling questions (4 priority parts) and 5 recyclability questions
  - REcycle_Printer - Generic with 3 dismantling and 2 recyclability questions
  - REcycle_Battery - Battery-specific with 6 dismantling questions (pack→modules→cells) and 5 component recyclability questions
  - REcycle_Laptop - Complex structure with 6 parameters including takeback, recyclability classification (green/orange/red lists)
  - REcycle_Heatpump - Generic with 3 dismantling and 2 recyclability questions
- Added Heatpump product category (replacing HVAC for better specificity)

### Changed
- Refactored REcycle architecture: core parameters shared where identical, product-specific parameters when different
- Products can override core parameters (e.g., Battery's fixed depollution score, Laptop's equal documentation weights)
- Parameters P4 (Dismantling) and P5 (Recyclability) are product-specific with different questions per product
- Renamed HVAC to Heatpump throughout the model

### Fixed
- Resolved namespace collision blocking SHACL/OWL generation
- All schema generation (JSON Schema, SHACL, OWL) now working for all 5 products

## [0.0.1] - 14 Nov 2025

### Added
- Initial project structure and repository setup from template: https://ce-rise-models.codeberg.page/template-data-model/
- Initial data model structure for indicators 
- Artifacts built and deployed to pages
