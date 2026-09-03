# Erdős problem #571 (rational exponents for Turán numbers of bipartite graphs): proof

[![CI](https://github.com/tadamcz/erdos571/actions/workflows/ci.yml/badge.svg)](https://github.com/tadamcz/erdos571/actions/workflows/ci.yml)

> **Note.** This README, the documentation in `Challenge.lean` and `formalization.yaml` were machine-written by Claude (Anthropic)
> at the direction of Tom Adamczewski, from the FrontierMath Erdős paper, the benchmark files and the module documentation inside
> the proof files, and reviewed by him. The Lean proofs themselves were written by GPT-6 Astra, as described below.

Machine-checked proof of [Erdős problem #571](https://www.erdosproblems.com/571) in Lean 4 with Mathlib, found autonomously by a
pre-release version of **GPT-6 Astra** (OpenAI) in the **FrontierMath Erdős** benchmark (Adamczewski and Bloom, 2026). The
repository packages the AI-written proof for the [Palomar registry](https://palomar-registry.org/): `Challenge.lean` is the
small statement a reader audits, `Solution.lean` proves it, and [Comparator](https://github.com/leanprover/comparator) checks that the two
statements coincide and that only the standard axioms are used.

## The result

The Turán (extremal) number `ex(n; G)` is the maximum number of edges in an `n`-vertex graph containing no copy of `G`.
For bipartite `G` its order of growth is poorly understood. Erdős and Simonovits asked whether, for every rational `α ∈
[1, 2)`, there is a bipartite graph `G` with `ex(n; G) ≍ n^α` (the "rational exponents conjecture";
erdosproblems.com/571, sources ErSi84 and others). Bukh and Conlon (J. Eur. Math. Soc. 2018) proved the analogous
statement for finite *families* of bipartite graphs, and many special families of rationals have since been realised by
single graphs, but the single-graph statement remained open.

The conjecture is **true**: for every rational `α ∈ [1, 2)` there is a finite bipartite graph `G` with `ex(n; G) =
Θ(n^α)`. Formally, the theorem proved is `Erdos571.erdos_571`, the statement of the FrontierMath Erdős benchmark: for
every `α : ℚ` with `1 ≤ α < 2` there are `q : ℕ` and a bipartite `G : SimpleGraph (Fin q)` such that `(fun n =>
(extremalNumber n G : ℝ))` is `Θ((n : ℝ) ^ (α : ℝ))` along `atTop`.

The compared declaration, from `Challenge.lean`:

```lean
theorem erdos_571 :
    ∀ α : ℚ, 1 ≤ α → α < 2 →
      ∃ q : ℕ, ∃ G : SimpleGraph (Fin q), G.IsBipartite ∧
        Asymptotics.IsTheta atTop
          (fun n : ℕ => (extremalNumber n G : ℝ))
          (fun n : ℕ => (n : ℝ) ^ (α : ℝ)) := by
  sorry
```



**Fidelity.** The compared theorem is the benchmark's formalisation of the erdosproblems.com statement. `extremalNumber n G` is
Mathlib's Turán number (maximum edge count of a `G`-free simple graph on `Fin n`); `G.IsBipartite` is Mathlib's
bipartiteness; `Asymptotics.IsTheta atTop` encodes `≍` (two-sided `≪`) for `n → ∞`, with both sides cast to `ℝ` and
`n^α` read as the real power `(n : ℝ) ^ (α : ℝ)`. The graph lives on `Fin q`, which loses no generality. No divergence
from the informal statement is known. The relation between this proof and the substantial existing literature
(Bukh–Conlon and later work) has not yet been worked out.

## Provenance

**Benchmark.** FrontierMath Erdős (Adamczewski and Bloom, 2026) evaluates AI systems on 68 open Erdős problems selected by Thomas F. Bloom, in the Lean proof
assistant, autonomously and under a fixed, disclosed budget ($300 and 72 hours of working time per attempt in the default configuration). The
agent works in a network-isolated Docker container with a Lean 4 toolchain (v4.27.0) and Mathlib, SageMath and Python; its final
`Spec.lean` is checked in a separate pristine container by Comparator against the trusted statement, permitting only `propext`,
`Quot.sound` and `Classical.choice`. The benchmark, harness and statements are public at
[epoch-research/LeanOpenProblems](https://github.com/epoch-research/LeanOpenProblems); the paper is in preparation. No human saw or steered the proof search.

**Statement.** The problem had no statement in Formal Conjectures. The statement was produced by the benchmark authors' autoformalization pipeline and reviewed for faithfulness by Thomas F. Bloom; the file the model received is [`apn/data/erdos_autoformalized/Isolated/Erdos571.erdos_571.lean`](https://github.com/epoch-research/LeanOpenProblems/blob/77882c437ca1dfefab3b27fa00f1d29788100311/apn/data/erdos_autoformalized/Isolated/Erdos571.erdos_571.lean).

**Resolutions.** One attempt resolved this statement.
"Default configuration" is the deepagent-based agent with subagents, memory and an offline arXiv snapshot under the benchmark's
budget of $300 and 72 hours of working time per attempt; "ReAct agent, larger budget" is a basic agent under a $1,000 budget.
**Cost** is computed from the attempt's exact token counts (from the harness's eval logs) at GPT-6 Astra's standard rates as provided
by OpenAI on 3 September 2026: $10 per million input tokens, $50 per million output tokens, $1 per million cache-read tokens and
$12.50 per million cache-write tokens. The harness itself metered spend at stand-in GPT-5.6 Sol prices, which is what the `usd` figure
in each file name reflects. **Working time** is the harness's `working_time` (time the agent was actually working, excluding waits on
API retries and rate limits), read from the harness's eval logs; the `h` figure in each file name is instead wall-clock time.
The Inspect transcripts are linked for the record (access may be restricted).

| Module | Role | Attempt | Cost | Working time | Tokens, millions (input / output / cache read / cache write) | Inspect log |
|---|---|---|---|---|---|---|
| `Erdos571/Resolutions/Erdos571_325usd_42h.lean` | **primary** (wired to `Solution.lean`) | ReAct agent, larger budget, 26 Aug 2026 (re-run) | $617 | 41.3 h | 0.35 / 3.3 / 222 / 18.1 | [transcript](https://viewer.hawk.hawkbench.com/permalink/sample/UGjEnixSG6RApwvDzjTtiv) |

## Proof account

The accounts below paraphrase the module documentation the model wrote inside each file; they describe the Lean proofs actually
present. They are not a human verification of the mathematics beyond what Comparator establishes.

**`Erdos571_325usd_42h`** (ReAct agent, larger budget, 26 Aug 2026 (re-run)). Constructs balanced rooted models for every rational parameter; the upper-bound closure replaces edges by paths of arbitrary length, adds two colour-class hubs and commutes with positive rooted powers (`UniversalHubModels.result`). The development is long (about 10,000 lines) and its relation to the existing literature has not yet been worked out.

**Informal summary from the FrontierMath Erdős paper** (Thomas F. Bloom, appendix; a fuller sketch is on the problem page of
erdosproblems.com): In the opinion of the paper's second author this is the most difficult of the five solutions. A proper human
understanding of this proof, including the relation between the AI proof and the substantial existing work on this
problem, will take some time.

## Repository layout

- `Challenge.lean` — the statement surface: definitions copied verbatim from the benchmark statement and the compared theorem with `sorry`.
- `Solution.lean` — imports the primary resolution module, in whose environment the compared theorem is proved.
- `Erdos571.lean`, `Erdos571/Resolutions/` — the AI-written proof module(s); `Erdos571.lean` imports the primary one.

- `comparator.json` — Comparator configuration naming `Erdos571.erdos_571`.
- `formalization.yaml` — structured metadata (provenance, sources, classification, automation, review) in the mathlib-initiative v0.4 format.
- `provenance/` — SHA-256 sums of the benchmark output files and unified diffs from them to the modules here.
- `scripts/verify-comparator.sh` runs the pinned Comparator, lean4export, NanoDa and Landrun locally (Linux); `scripts/validate-formalization.rb` checks the metadata file.
- `.github/workflows/ci.yml` — builds the project and runs Comparator (layout from the Palomar template; the template's doc-gen4 job is omitted because the modules import all of Mathlib).

## Edits relative to the benchmark output

The proof modules are the model's final `Spec.lean` files, verified by the benchmark, with only the following mechanical changes; the
exact diffs are in `provenance/`. The toolchain was moved from Lean v4.27.0 / Mathlib (via Formal Conjectures at commit
`488aade2`) to Lean v4.28.0 / Mathlib v4.28.0, the oldest release Palomar accepts; the only change this required is the
`loopless` adjustment listed below for the files it affects.

- `Erdos571_325usd_42h.lean` (SHA-256 of the benchmark output: `084cf1dcd8d28cd7b4a8614d4a9bca592bc8a571971a98bd9538525b6bea44f4`):
  - line 1: `import FormalConjecturesUtil` → `import Mathlib`
  - no other changes (react-agent file: statement contained only the proved direction)
  - port to Mathlib v4.28.0: Mathlib v4.28.0 changed the field `SimpleGraph.loopless` from `Irreflexive Adj` to the class `Std.Irrefl Adj`, so proofs of that field need a `constructor` step (or an anonymous-constructor wrapper) and uses of `G.loopless` as a function become `G.loopless.irrefl`. Changed lines:
    - line 469: inserted `constructor` at the start of the `loopless := by` block
    - line 1416: `loopless := by intro x h; exact h.2 rfl` → `loopless := by constructor; intro x h; exact h.2 rfl`
    - line 1526: `loopless := by intro u h; cases u; exact h rfl; exact h.ne rfl` → `loopless := by constructor; intro u h; cases u; exact h rfl; exact h.ne rfl`
    - line 1572: `loopless := by intro u h; cases u <;> exact h` → `loopless := by constructor; intro u h; cases u <;> exact h`
    - line 2254: `loopless := by intro v; cases v <;> exact not_false` → `loopless := by constructor; intro v; cases v <;> exact not_false`
    - line 3358: inserted `constructor` at the start of the `loopless := by` block
    - line 4636: `loopless := by intro v; cases v <;> exact not_false` → `loopless := by constructor; intro v; cases v <;> exact not_false`
    - line 6987: `loopless := by intro x h; exact h.1 rfl` → `loopless := by constructor; intro x h; exact h.1 rfl`

## Verification

```sh
lake exe cache get
lake build
ruby scripts/validate-formalization.rb
./scripts/verify-comparator.sh   # Linux: Comparator + NanoDa under Landrun
```

CI runs the same checks. The compared theorem depends on no `sorry` and on no axioms beyond `propext`, `Quot.sound` and
`Classical.choice`. This repository is prepared for submission to Palomar through the
[submission form](https://submit.palomar-registry.org/) with the full commit SHA; registration is a separate step by the maintainer.

## Licence and attribution

This repository snapshot is licensed under the Apache License 2.0 (see `LICENSE`). The benchmark statement it reproduces is
from the FrontierMath Erdős benchmark (Adamczewski and Bloom; LeanOpenProblems, MIT licence; see `NOTICE`). Cited papers,
erdosproblems.com and Mathlib retain their own licences.
