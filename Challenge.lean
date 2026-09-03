import Mathlib

/-!
# Erdős problem #571 (rational exponents for Turán numbers of bipartite graphs): proof

*Reference:* [erdosproblems.com/571](https://www.erdosproblems.com/571)

The Turán (extremal) number `ex(n; G)` is the maximum number of edges in an `n`-vertex graph
containing no copy of `G`. For bipartite `G` its order of growth is poorly understood. Erdős and
Simonovits asked whether, for every rational `α ∈ [1, 2)`, there is a bipartite graph `G` with
`ex(n; G) ≍ n^α` (the "rational exponents conjecture"; erdosproblems.com/571, sources ErSi84 and
others). Bukh and Conlon (J. Eur. Math. Soc. 2018) proved the analogous statement for finite
*families* of bipartite graphs, and many special families of rationals have since been realised by
single graphs, but the single-graph statement remained open.

The conjecture is **true**: for every rational `α ∈ [1, 2)` there is a finite bipartite graph `G`
with `ex(n; G) = Θ(n^α)`. Formally, the theorem proved is `Erdos571.erdos_571`, the statement of
the FrontierMath Erdős benchmark: for every `α : ℚ` with `1 ≤ α < 2` there are `q : ℕ` and a
bipartite `G : SimpleGraph (Fin q)` such that `(fun n => (extremalNumber n G : ℝ))` is `Θ((n : ℝ)
^ (α : ℝ))` along `atTop`.

This file is the small statement surface a reader should audit: the theorem `Erdos571.erdos_571`
below is the compared declaration, and the conjecture is proved in `Solution.lean` and the module
it imports. Only the theorem's `sorry` is filled in there.

The statement is copied verbatim from the FrontierMath Erdős benchmark file
`apn/data/erdos_autoformalized/Isolated/Erdos571.erdos_571.lean` in [LeanOpenProblems](https://github.com/epoch-research/LeanOpenProblems) at commit
`77882c437ca1dfefab3b27fa00f1d29788100311` (formalized by the benchmark authors' autoformalization pipeline and reviewed by
Thomas F. Bloom; the problem had no statement in Formal Conjectures). It is exactly the
statement the AI system was given.
-/
open Filter SimpleGraph

namespace Erdos571

/--
**Erdős problem #571 (rational exponents for bipartite Turán numbers).** For any rational
$\alpha \in [1,2)$ there exists a (finite) bipartite graph $G$ such that
$\mathrm{ex}(n;G)\asymp n^{\alpha}$, where $\mathrm{ex}(n;G)$ (Mathlib's `extremalNumber n G`) is the
maximum number of edges of a graph on $n$ vertices containing no copy of $G$, and $\asymp$ is
`Asymptotics.IsTheta` as $n \to \infty$. This is the statement of the FrontierMath Erdős benchmark.
-/
theorem erdos_571 :
    ∀ α : ℚ, 1 ≤ α → α < 2 →
      ∃ q : ℕ, ∃ G : SimpleGraph (Fin q), G.IsBipartite ∧
        Asymptotics.IsTheta atTop
          (fun n : ℕ => (extremalNumber n G : ℝ))
          (fun n : ℕ => (n : ℝ) ^ (α : ℝ)) := by
  sorry

end Erdos571
