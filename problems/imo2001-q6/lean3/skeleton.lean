import .defs

variables {a b c d : ℤ}

theorem imo2001_q6 (hd : 0 < d) (hdc : d < c) (hcb : c < b) (hba : b < a)
  (h : a*c + b*d = (a + b - c + d) * (-a + b + c + d)) :
  ¬ prime (a*b + c*d) := sorry
