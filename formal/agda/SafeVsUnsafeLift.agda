{-# OPTIONS --cubical --safe #-}

module SafeVsUnsafeLift where

open import Cubical.Foundations.Prelude
open import Cubical.Data.Empty as ⊥ using (⊥; ⊥-elim)

------------------------------------------------------------------------
-- Two universes (PTV-style)
-- E : syntactic entities (quotes, codes, “terms”)
-- Prop : truth-bearers (h-props)
------------------------------------------------------------------------

data E : Type₀ where
  zero      : E
  snowQuote : E
  liarQuote : E

record Prop : Type₁ where
  constructor prop
  field
    ∣_∣      : Type₀
    isProp∣_∣ : isProp ∣_∣

open Prop

------------------------------------------------------------------------
-- SafeLift = an explicit, inhabited coercion-like witness that:
-- (1) meaning exists independently
-- (2) meaning survives removal of *any* evaluation operator R : Prop → Prop
------------------------------------------------------------------------

record SafeLift (ι : E) (φ : Prop) : Type₀ where
  constructor safeLift
  field
    independentMeaning        : ∣ φ ∣
    survivesWithoutEvaluation : (R : Prop → Prop) → ∣ φ ∣

open SafeLift

------------------------------------------------------------------------
-- Some “safe” examples (just to show the notion is not vacuous)
------------------------------------------------------------------------

-- A trivial “proposition”: True is an h-prop and is inhabited by tt
trueProp : Prop
trueProp = prop ⊤ isPropUnit

safeSnow : SafeLift snowQuote trueProp
safeSnow = safeLift tt (λ _ → tt)

------------------------------------------------------------------------
-- The Liar impossibility:
-- If someone hands you a SafeLift for liarQuote into ANY proposition φ,
-- you can derive ⊥ by picking a hostile evaluator R that demands φ → ⊥.
------------------------------------------------------------------------

-- Negation-as-evaluator: given ψ, produce the proposition (∣ψ∣ → ⊥)
Neg : Prop → Prop
Neg ψ = prop (∣ ψ ∣ → ⊥) (isProp→ isProp⊥)

liarImpossible : (φ : Prop) → SafeLift liarQuote φ → ⊥
liarImpossible φ h =
  let notφ : (∣ φ ∣ → ⊥)
      notφ = survivesWithoutEvaluation h Neg
  in notφ (independentMeaning h)
