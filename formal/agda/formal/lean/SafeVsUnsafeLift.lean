/-
Pre-Semantic Type Validation (PTV) — Step-Zero Rejection Criterion
Lean demo: SafeLift + Liar impossibility (minimal, Lean core only)
-/

namespace StepZero

-- E = syntactic entities (quotes, codes, designators, …)
structure E where
  name : String
deriving DecidableEq

def zero      : E := ⟨"zero"⟩
def snowQuote : E := ⟨"snowQuote"⟩
def liarQuote : E := ⟨"liarQuote"⟩

-- Prop = propositions (truth-bearers), packaged with proof-irrelevance
structure Prop where
  carrier : Type
  isProp  : ∀ (a b : carrier), a = b

-- A SafeLift witness:
-- independent meaning + survives "removal of evaluation" for any evaluator R : Prop → Prop
structure SafeLift (ι : E) (φ : Prop) where
  independent : φ.carrier
  survivesWithoutEvaluation : ∀ (R : Prop → Prop), φ.carrier

-- A trivial Prop: True is a proposition
def TrueProp : Prop :=
  { carrier := True
    isProp  := by intro a b; cases a; cases b; rfl }

-- Example: a safe lift exists for a harmless quote into TrueProp
def safeSnow : SafeLift snowQuote TrueProp :=
  { independent := True.intro
    survivesWithoutEvaluation := by intro R; exact True.intro }

-- Negation-as-evaluator: R ψ = (ψ → False), packaged as a Prop
def Neg (ψ : Prop) : Prop :=
  { carrier := ψ.carrier → False
    isProp  := by
      intro f g
      -- proof-irrelevance for functions into False (classic/extensional in Lean)
      funext x
      cases (f x) }

-- Liar impossibility:
-- If a SafeLift exists for liarQuote into any φ, contradiction follows by choosing Neg
theorem liar_impossible (φ : Prop) (h : SafeLift liarQuote φ) : False :=
by
  have notφ : φ.carrier → False := h.survivesWithoutEvaluation Neg
  exact notφ h.independent

end StepZero
