# Pre-Semantic Type Validation (PTV)
### The Step-Zero Rejection Criterion

A formation-level type-theoretic framework for rejecting self-referential paradoxes
prior to propositional lift.

---

## Overview
This repository presents a formation-level, type-theoretic framework that rejects
self-referential paradoxes *before* they acquire propositional status.

The central claim is classical and precise: **not every meaningful expression is a proposition**,
and truth predicates apply only to propositions, not to bare terms or designators.

---

## Core Distinction
A fundamental logical distinction underlies the framework:

- **Term (Designation)**: an expression that denotes an object or concept and has meaning.
- **Proposition (Truth-bearer)**: an expression eligible for truth or falsity.

Meaning alone does not license truth attribution.  
Only propositions admit truth-values.

For example:
- *“horse”* is meaningful, but it is neither true nor false.
- Likewise, expressions that merely designate linguistic items do not become truth-apt
  by syntactic appearance alone.

---

## The Step-Zero Problem
Classical paradoxes (Liar, Gödel, Turing diagonalization) begin with a meta-linguistic
assumption that a syntactic entity can be treated as a proposition without an explicit,
well-typed coercion.

This unlicensed shift occurs *prior* to any formal encoding or arithmetization.
The **Step-Zero Rejection Criterion** blocks such formations at the moment they are proposed.

---

## Pre-Semantic Type Validation (PTV)
The framework distinguishes two universes:

- **E** — syntactic entities (terms, quotations, Gödel numbers, machine descriptions)
- **P** — propositions (truth-bearers)

Any lift from **E → P** must be:
1. Explicitly exhibited
2. Independently meaningful prior to evaluation
3. Invariant under removal of the evaluating operator

If these conditions fail, the expression is ill-formed and rejected at the formation level.

---

## Consequences
Under this stratified regime:

- Liar-type constructions fail as category errors
- Gödel’s self-referential sentence cannot be formed
- Turing’s diagonal machine does not exist as a well-typed object
- Diagonalization-based undecidability collapses structurally

Consistency is restored through **syntactic discipline**, not semantic restriction.

---

## Status
- Formalized in **Cubical Agda** and **Lean 4**
- Mechanically verified
- Independent of semantic paradox resolution strategies

---

## Citation
If you reference this work, please cite:

Najih O. Salhab.  
*The Step-Zero Rejection Criterion*.  
Zenodo, 2025.

---

## License
This work is licensed under **Creative Commons Attribution–NonCommercial 4.0 (CC BY-NC 4.0)**.

Academic, research, and educational use is explicitly permitted.  
Commercial use requires prior written permission from the author.
