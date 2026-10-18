# Lesson plan R by Richel

- Date: 2026-10-19
- Course: R
- Author: Richel
- [GitLab repository](https://gitlab.naiss.se/hpc/training/R-matlab-julia-HPC)
- [Lesson plan](../../lesson_plans/20261019_richel/README.md)
- [Evaluation](../../evaluations/20261019_r/README.md)
- [Reflection](../../reflections/20261019_richel/README.md)

## 2026-10-15

Things from my previous reflections:

- [x] Remove learning outcome 
  'I can start an interactive session with multiple cores'
- [x] Remove learning outcome 
  'I can verify I am on the login node yes/no'
- [x] Suggest to make confidences optional (i.e. one can get away
  to not fill in a confidence) to remove this skew

I learned that self-rate confidence is useless to assess if a skill
is actually learnt `[O'Donoghue et al., 2018]` or that a self-assesses
confidence has an irrelevant correlation `[Javed and Bhatti, 2022]` (r = -0.03)
`[Brinkman et al, 2015]` (r = 0.2). Hence, I replaced my learning
outcomes by 'I have yes/no' questions:

- I have loaded the modules to run a specific version of R
- I have run an R script from the command-line
- I have started RStudio

Let's take a look at the schedule, for my sessions (I will update
this table to track my progress):

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

Time  | Topic                   | Status
------|-------------------------|-----------
.     | The common things       | Done, last check needed
9:00  | (optional) First login  | Done, last check needed
10:00 | Introduction            | Done, last check needed
.     | Syllabus                | Done, last check needed
10:20 | Load modules and run    | Done, last check needed
14:15 | RStudio                 | Done, last check needed
15:15 | Summary                 | Done, last check needed
.     | Evaluation              | Done, last check needed, need form to be created

<!-- markdownlint-enable MD013 -->

And also:

- Update common material to reflect Arrhenius as the example used

I heard from BC that RStudio does not work on Arrhenius. That simplifies my
teaching :-)

The NAISS GitLab runners do not work well. I spent some time on making
a GitHub not-really-mirror. I got it to work, i.e. it can deploy
a Zensical website.

## References


- `[Brinkman et al, 2015]` Brinkman, D., Tichelaar, J., Van Agtmael, M. V., De Vries, T., & Richir, M. (2015). Self‐reported confidence in prescribing skills correlates poorly with assessed competence in fourth‐year medical students. The Journal of Clinical Pharmacology, 55. <https://doi.org/10.1002/jcph.474>
- `[Javed and Bhatti, 2022]` Javed, M., & Bhatti, U. (2022). Students’ performance in clinics and self-perceived Confidence in performing Endodontic procedures: A correlation study. Pakistan Journal of Medical Sciences, 39, 203 - 208. <https://doi.org/10.12669/pjms.39.1.6870>
- `[O'Donoghue et al., 2018]` O'Donoghue, D., Davison, G., Hanna, L., McNaughten, B., Stevenson, M., & Thompson, A. (2018). Calibration of confidence and assessed clinical skills competence in undergraduate paediatric OSCE scenarios: a mixed methods study. BMC Medical Education, 18. <https://doi.org/10.1186/s12909-018-1318-8>
