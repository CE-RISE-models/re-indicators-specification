# Changelog

All notable changes to the CE-RISE RE-Indicators Specification Data Model will be documented in this file.

## [0.0.2] - Unreleased

### Added
- Complete REcycle indicator implementation for PV panels with 6 parameters and 19 questions
  - Documentation availability (4 questions)
  - Material composition (3 questions)
  - Depollution (5 questions)
  - Dismantling (3 questions)
  - Recyclability rate (2 questions)
  - Take-back scheme - Bonus (2 questions)
- All answer options with scoring (0-5 scale) for PV REcycle indicator
- Product configuration structure for REcycle_PV

### Changed
- Clarified that REcycle indicators are product-specific, not universal
- Renamed REcycle.yaml to REcycle_PV.yaml to explicitly indicate PV-specific implementation
- Fixed score data types from string to float for proper numeric computation
- Updated model structure to support product-specific indicator implementations

### Fixed
- Corrected score values to use float(X.0) format for proper type generation in JSON Schema and SHACL
- Fixed typos in answer option texts (identifier, safety, proprietary)

## [0.0.1] - 14 Nov 2025

### Added
- Initial project structure and repository setup from template: https://ce-rise-models.codeberg.page/template-data-model/
- Initial data model structure for indicators 
- Artifacts built and deployed to pages
