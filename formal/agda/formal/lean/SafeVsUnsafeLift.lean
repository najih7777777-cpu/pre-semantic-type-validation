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

-- “Truth-bearers” live in Prop (truth-apt only)
structure TruthBearer where
  carrier : Prop

-- Negation-as-evaluator: maps a truth-bearer ψ to (ψ → False)
def Neg (ψ : TruthBearer) : TruthBearer :=
  { carrier := ψ.carrier → False }

-- SafeLift: a witness that (ι : E) is allowed to be lifted into φ,
-- and that the lift “survives” any evaluator R by producing (R φ).
structure SafeLift (ι : E) (φ : TruthBearer) where
  independent : φ.carrier
  survivesWithoutEvaluation : ∀ (R : TruthBearer → TruthBearer), (R φ).carrier

-- Liar impossibility:
-- If a SafeLift exists for liarQuote into any φ, contradiction follows by choosing Neg
theorem liar_impossible (φ : TruthBearer) (h : SafeLift liarQuote φ) : False :=
by
  have notφ : φ.carrier → False := h.survivesWithoutEvaluation Neg
  exact notφ h.independent

end StepZero
