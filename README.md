# Hiroshima Responsibility Functor

[![Lean CI](https://github.com/GhostDriftTheory/hiroshima-responsibility-functor-test/actions/workflows/lean.yml/badge.svg)](https://github.com/GhostDriftTheory/hiroshima-responsibility-functor-test/actions/workflows/lean.yml)

*All theorems machine-checked. Conclusions are conditional on explicit,
documented premises. Historical and institutional facts are axioms, not
theorems.*

This bundle contains a category-theoretic and Lean-formalized sketch of the
Hiroshima Responsibility Functor.

## Files

- `HiroshimaResponsibility.lean`
  - Lean 4 formalization without mathlib.
  - Defines the ordinary corporate decision category `C`.
  - Defines the Hiroshima responsibility category `R`.
  - Defines the functor `F_H : C -> R`.
  - Proves that `F_H` preserves identities and composition.
  - Proves that `F_H(q o p)` is the responsibility composite.
  - Defines `AdmBV` as passage through both Beacon `B` and Verification `V`.
  - Adds `AdmBV_factorizes`, the LaTeX-style factorization predicate:
    `p = suffix-after-V o middle-B-to-V o prefix-to-B`.
  - Adds `splitAtObj`, `splitAtB`, and `splitAtV` for path splitting.
  - Proves `AdmBV_iff_factorizes`, the theorem connecting the path-object
    implementation with the factorization exposition.
  - Proves universal exclusion:
    - any path not passing `B` is not admissible;
    - any path not passing `V` is not admissible.
  - Defines `CivilizationalResponsibilityTech` as an abstract typeclass with
    real witness constraints.
  - Instantiates nuclear weapons and AI as members of that typeclass.
  - Proves `nuclear_ai_same_civilizational_layer`.
  - Proves `two_crts_share_R`, showing that any two CRT instances provide
    inadmissible-path witnesses in the same responsibility category `R`.
  - Proves `hiroshima_conditioned_unique` from explicit historical premises.
  - Records Hiroshima's historical status as an explicit external axiom, not as
    a theorem proved by category theory.

- `hiroshima_responsibility_category.tex`
  - LaTeX exposition with definitions, propositions, proof sketches, diagram,
    interpretation, and limits of the claim.

## Main Claim

Hiroshima placement is modeled as a functor:

```text
F_H : C -> R
```

from the ordinary corporate decision category

```text
C = D -> P -> O
```

to the Hiroshima responsibility category

```text
R = D_H -> P_H -> B -> E -> V -> A -> O'
```

where:

- `D_H` means corporate decision under Hiroshima place-context.
- `P_H` means profit/efficiency evaluation under Hiroshima place-context.
- `B` is Beacon admissibility.
- `E` is evidence.
- `V` is verification / verifiable evidence.
- `A` is accountable decision.
- `O'` is accountable operational outcome.

## Functor Definition

On objects:

```text
F_H(D) = D_H
F_H(P) = P_H
F_H(O) = O'
```

On generating morphisms:

```text
F_H(p : D -> P) = m : D_H -> P_H
F_H(q : P -> O) = o o a o v o e o b : P_H -> O'
```

Therefore:

```text
F_H(q o p)
= F_H(q) o F_H(p)
= o o a o v o e o b o m
: D_H -> O'
```

## Admissibility

`AdmBV(X,Y)` means that a morphism factors through both Beacon `B` and
Verification `V`.

```text
f in AdmBV(X,Y)
iff
there exist x : X -> B, y : B -> V, z : V -> Y
such that f = z o y o x
```

The Lean file proves the universal form:

```text
not_passB_not_admissible :
  for any path p, if p does not pass B, then p is not in AdmBV

not_passV_not_admissible :
  for any path p, if p does not pass V, then p is not in AdmBV
```

The LaTeX-facing factorization form is also present:

```text
AdmBV_factorizes p
iff
there exist prefix : X -> B,
             middle : B -> V,
             suffix : V -> Y
such that p = suffix o middle o prefix
```

The Lean theorem proving the equivalence is named:

```text
AdmBV_iff_factorizes
```

This theorem is proved in Lean. It is not an axiom.

## Why the H in F_H is Hiroshima specifically

The functor `F_H` is named for Hiroshima because, under the explicit premises
recorded in the Lean file, Hiroshima is treated as the conditioned unique
location satisfying this conjunction:

1. Historical witness to `not AdmBV` at civilizational scale.
2. Institutional preservation as world memory.
3. Existing AI governance anchor through the Hiroshima AI Process.

The conditioned uniqueness claim is structural, not moral. It does not say that
other war-affected cities are morally lesser. It says that this formal role is
identified by the specific conjunction of nuclear-layer witness, institutional
memory, and AI governance anchoring, under the premises admitted in the file.

## External Historical Premise

The Lean file explicitly marks the historical premise as an axiom:

```text
axiom hiroshima_historical_witness :
  (exists decision,
    not AdmBV decision
    and CivilizationalScale decision
    and WorldMemory decision)
  and HiroshimaAIProcessAnchor
```

This is intentional. Category theory does not prove historical facts. It only
formalizes how those facts function once admitted as premises.

## Conditioned Uniqueness

The Lean file proves the following theorem:

```lean
hiroshima_conditioned_unique :
  for any city x,
  if x received an intentional nuclear attack
  and x holds an AI governance anchor,
  then x = Hiroshima.
```

This is a theorem, not an axiom. It is a conditioned uniqueness theorem proved
by case analysis from explicit historical axioms:

- Hiroshima received an intentional nuclear attack.
- Nagasaki received an intentional nuclear attack.
- Hiroshima holds an internationally recognized AI governance anchor.
- Nagasaki does not hold an equivalent AI governance anchor in this model.
- Intentional nuclear attacks occurred only at Hiroshima and Nagasaki.

The two conditions are not arbitrary inside this model. Under the stated
premises, they identify a city that has both:

1. Institutional experience of the structural problem: intentional conversion
   of humans into calculation objects at civilizational scale.
2. Existing international recognition as an AI governance reference point.

The file also proves:

```lean
nuclear_ai_same_civilizational_layer
```

`CivilizationalResponsibilityTech` is an abstract typeclass with two real
constraints:

1. The technology must have a witness for an inadmissible decision path.
2. The technology must have a witness for civilizational-scale consequences
   through such a path.

Nuclear weapons satisfy both constraints via `hiroshima_historical_witness`.
AI systems satisfy the inadmissible-path constraint via the existing
`bypassBeaconPath` proof and the civilizational-scale constraint via the
explicit axiom `ai_has_civilizational_potential`, documented in the Lean file.
`nuclear_ai_same_civilizational_layer` proves both are members of the same
abstract type with real, non-trivial constraints.

The file also proves `two_crts_share_R`: for any two instances of
`CivilizationalResponsibilityTech`, both provide inadmissible-path witnesses in
the same responsibility category `R`. This is the universal responsibility
structure. The responsibility category `R` is not parametric over the specific
technology; it is the fixed target into which any CRT instance maps. The full
isomorphism `R_nuclear ~= R_ai` is therefore not required: universality is
expressed by the shared target `R` itself.

This does not claim moral equivalence, inevitable AI harm, or that Hiroshima is
necessary for global AI governance adoption.

## Scope and Intentional Limits

Three questions are sometimes raised about this formalization. Each reflects a
misunderstanding of scope, addressed here explicitly.

**On `no_anchor_nagasaki`:**

This axiom records an external institutional fact, not a gap in the proof. Lean
cannot prove the absence of a real-world governance process; it records that
absence as a documented premise. The source is the absence of an equivalent
internationally recognized AI governance anchor for Nagasaki as of this
writing. That absence is a factual claim about the world, not a conclusion
derived from category theory. It is placed as an axiom precisely because axioms
are the correct location for such claims in this formalization.

**On proof of PoC success:**

This file does not prove that a proof-of-concept will succeed. It proves that
structural basis, conditional uniqueness, logistics infrastructure, and
implementation environment converge in Hiroshima under the stated premises.
Operational success is a question for implementation, not for formal proof.
Asking this file to prove PoC success would be asking category theory to do
empirical prediction. That is outside its scope by design.

**On "why should we trust this team":**

That question is not answerable inside a formal proof system, nor should it be.
What this file does is make every premise visible, every inference checkable,
and every limit of the claim explicit. The credential this formalization offers
is not authority; it is verifiability. A team that documents its assumptions
this precisely is a team whose reasoning can be examined, challenged, and
improved. That is the claim.

## Four-Stage Chain: Hiroshima as Origin of Next-Generation AI Logistics

The Lean file proves a four-stage structural chain.

**Stage 1** (`admissible_autonomous_logistics_needs_assurance`):

Admissible next-generation AI logistics requires AI assurance, modeled as
passage through Verification `V`. This follows from
`not_passV_not_admissible`. No new axioms.

**Stage 2** (`hiroshima_conditioned_unique`):

AI assurance is conditionally grounded in Hiroshima under the model's
conditioned uniqueness claim: under the stated premises, the city satisfying
`IntentionalNuclearAttack` and `AIGovernanceAnchor` is Hiroshima.

**Stage 3** (`hiroshima_unique_for_ai_logistics`):

Under the stated premises, Hiroshima is the city singled out by the structural
conditions for next-generation AI logistics. `WorldLogisticsInfrastructure` is
now a defined conjunction of five documented components, each supported by a
separate historical or institutional axiom:

- `hiroshima_manufacturing_hub`: Mazda SCM, automotive cluster, shipbuilding
  legacy.
- `hiroshima_port_gateway`: Ujina / Hiroshima Port, Seto Inland Sea gateway,
  RORO ships, Asia maritime routes.
- `hiroshima_maritime_heritage`: Murakami Suigun, naval-port history, and
  centuries of Seto Inland Sea logistics knowledge.
- `hiroshima_tourism_flow`: Miyajima, Peace Park, inbound tourism, and human
  flow infrastructure.
- `hiroshima_right_sized_scale`: compact city structure, nearby port /
  manufacturing / tourism / human-flow sites, reachable stakeholders, and a
  scale suitable for integrated PoC implementation.

`hiroshima_world_logistics` is therefore a theorem, not an axiom. Hiroshima's
logistics base is proved from specific documented component premises, not
asserted as a single claim. Uniqueness follows directly from Stage 2.

**Stage 4** (`hiroshima_poc_environment`):

Hiroshima Prefecture has the institutional and physical environment for
proof-of-concept implementation: compact city scale, port / manufacturing /
tourism convergence, multi-sector collaboration, and an active AI governance
anchor.

**Combined** (`hiroshima_four_stage_ai_logistics_chain`):

All four stages are proved in a single theorem. Stages 1 and 2 use no new
axioms. Stage 3 uses five component premises to prove
`hiroshima_world_logistics`. Stage 4 uses the explicit premise
`hiroshima_poc_environment`.

This does not claim AI logistics cannot be developed elsewhere. It shows that,
under the explicit premises stated in this file, the structural basis,
conditional uniqueness, logistics infrastructure, and implementation
environment converge in Hiroshima. The strength of this convergence is
conditional on the premises admitted. The premises are documented and
machine-readable; they are not hidden assumptions.

## Explicit Premises and Sources

The Lean file marks all historical and institutional facts as explicit axioms.
The strength of every conclusion in this file is conditional on these premises.
The table below maps each axiom to its documented source.

| Axiom | Claim | Source |
|-------|-------|--------|
| `nuclear_hiroshima` | Hiroshima received an intentional nuclear attack | Historical record, August 6, 1945 |
| `nuclear_nagasaki` | Nagasaki received an intentional nuclear attack | Historical record, August 9, 1945 |
| `no_anchor_nagasaki` | Nagasaki does not hold an AI governance anchor in this model | Absence of equivalent process as of this writing |
| `nuclear_cities_exhaustive` | Intentional nuclear attacks occurred only at Hiroshima and Nagasaki | Historical record |
| `anchor_hiroshima` | Hiroshima holds an internationally recognized AI governance anchor | G7 Hiroshima AI Process (2023); OECD link in Sources |
| `ai_has_civilizational_potential` | AI systems can generate civilizational-scale inadmissible consequences | G7 Hiroshima AI Process; EU AI Act high-risk provisions |
| `hiroshima_manufacturing_hub` | Hiroshima is a manufacturing hub with global SCM | Mazda sustainability report; shipbuilding historical records |
| `hiroshima_port_gateway` | Hiroshima has port infrastructure and Seto Inland Sea gateway | Hiroshima Port container terminal; HIROSHIMA FLOW document |
| `hiroshima_maritime_heritage` | Hiroshima has deep maritime heritage | Murakami Suigun historical records; naval port records |
| `hiroshima_tourism_flow` | Hiroshima has tourism and human flow infrastructure | UNESCO (Miyajima); Hiroshima Peace Memorial Hall |
| `hiroshima_right_sized_scale` | Hiroshima has right-sized operational scale for integrated PoC | HIROSHIMA FLOW policy document |
| `hiroshima_poc_environment` | Hiroshima has PoC implementation environment | HIROSHIMA FLOW policy document; OnZaLinx / GhostDrift PoC |

## Sources

- UNESCO, Hiroshima Peace Memorial / Genbaku Dome:
  <https://whc.unesco.org/en/list/775/>
- Hiroshima National Peace Memorial Hall for the Atomic Bomb Victims:
  <https://www.hiro-tsuitokinenkan.go.jp/en/about/index.html>
- OECD, G7 Hiroshima Process on Generative AI:
  <https://www.oecd.org/en/publications/g7-hiroshima-process-on-generative-artificial-intelligence-ai_bf3c0c60-en.html>
- JapanGov, Hiroshima AI Process:
  <https://www.japan.go.jp/kizuna/2024/02/hiroshima_ai_process.html>
- EU AI Act Explorer:
  <https://ai-act-service-desk.ec.europa.eu/en/ai-act-explorer>
- UNESCO, Itsukushima Shinto Shrine:
  <https://whc.unesco.org/en/list/776/>
- Hiroshima Port international container terminal:
  <https://www.h-port.co.jp/en/container/>
- Mazda supply chain management:
  <https://www.mazda.com/en/sustainability/social/supply-chain/>

## Verification

Lean:

```powershell
lake env lean HiroshimaResponsibility.lean
```

LaTeX:

```powershell
pdflatex hiroshima_responsibility_category.tex
```

Note: this workspace did not have a TeX compiler installed during verification,
so only the Lean file was machine-checked here.
