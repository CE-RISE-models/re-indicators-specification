# Changelog

All notable changes to the CE-RISE RE-Indicators Specification Data Model will be documented in this file.

## [0.0.2] - Unreleased

### Added
- REmanufacture indicator complete for Laptop and Printer with fully shared core parameters (P1-P4: inspection/testing, disassembly/assembly, cleaning, reprocessing)
- REpair indicator complete for Laptop with 10 parameters
- REuse indicator complete for Laptop and Printer with fully shared core parameters (P1-P5: diagnosis, warranty, reset, data confidentiality, ownership)
- REcycle indicator complete for all 5 products (PV, Battery, Laptop, Printer, Heatpump) with core and product-specific parameters

### Changed
- Architecture improvements for parameter reusability across products

### Fixed
- Resolved namespace collision blocking SHACL/OWL generation
- All schema generation (JSON Schema, SHACL, OWL) now working for all 5 products

## [0.0.1] - 14 Nov 2025

### Added
- Initial project structure and repository setup from template: https://ce-rise-models.codeberg.page/template-data-model/
- Initial data model structure for indicators 
- Artifacts built and deployed to pages
