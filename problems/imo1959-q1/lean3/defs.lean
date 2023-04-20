import tactic.ring
import data.nat.prime

def GOAL := ∀ n : ℕ, nat.coprime (21 * n + 4) (14 * n + 3) 

notation `GOAL` := GOAL
