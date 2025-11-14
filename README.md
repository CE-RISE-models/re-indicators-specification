# CE-RISE RE-Indicators Specification Data Model

This repository provides the data model specifying the RE-indicators in the CE-RISE project.

---

## Repository structure

```
/
├─ model/          # LinkML source files (.yaml)
├─ profiles/       # composition YAMLs combining modules
├─ mappings/       # SSSOM and JSON-LD mappings
├─ generated/      # auto-generated JSON Schema, SHACL, OWL
├─ samples/        # example data instances
├─ tests/          # validation tests
└─ README.md
```

---


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

<a href="https://www.nilu.com" target="_blank" rel="noopener noreferrer">
  <img src="https://nilu.no/wp-content/uploads/2023/12/nilu-logo-seagreen-rgb-300px.png" alt="NILU logo" width="40"/>
</a>

Developed by EMPA and NILU (Riccardo Boero — ribo@nilu.no) within the CE-RISE project.
