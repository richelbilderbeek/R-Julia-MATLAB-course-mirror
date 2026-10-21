# Reflection

- Date: 2026-10-19
- Course: R
- Author: Richel
- [Lesson plan](../../lesson_plans/20261019_richel/README.md)
- [Evaluation](../../evaluations/20261019_r/README.md)
- [Reflection](../../reflections/20261019_richel/README.md)

## Before teaching

I prepared just well enough in time.
It was not the first time me and the other teachers taught,
so I predicted it to go well enough.
The hardest in preparation was the NAISS GitLab server not starting
the CI runners.

## Login session

The login session went great. We were with 6 participants
that came in a bit spread over time and 4 teachers.
Due to this setup, each participants had a teacher and proper
time to login. It was fun to work together as a team so smoothly.

## During teaching

My first session had a good pace, but I ended it 15 minutes too early (in
a 60 minute session), which was bad: the beginners could have used that
time! Also: I had just gone through all BO rooms twice, with already
some of the learners gone, so I could focus on the beginners.
I am sorry for the beginners! And I wish I could have made more
contact with the learners.

There was a learner that discovered a `wget` command that did not
work. He demonstrated this and indeed, the URL was broken.
This made me look needlessly stupid. I will add a CI script

- [x] Add CI script to check if `wget` commands point to valid URLs
- [x] Confirm it breaks
- [x] Fix the broken URL

During lunch, it became clear that RStudio can run on Arrhenius.
I asked a colleague to teach how to do so, in case there
would be no documentation. But that same person wrote
that documentation and hence I could teach RStudio.
Sure, the documentation is minimal, but maybe it would work.

My second session on RStudio was close to be of the right length,
but it was tight. Also, I missed giving a demo on RStudio,
even though the procedures are so different between HPC clusters.
I do feel I need not to ask for more time: I feel using the
right amount of time in my first session enables the learners
to finish this session on time.

The Arrhenius RStudio documentation worked! Now only add screenshots
and a video.

- [x] Add screenshots
- [ ] Add video

The summary felt too long and complex. Also, some examples
were outdated or used Pelle instead of Arrhenius

- [x] Condense summary
- [x] Use Arrhenius examples in evaluation

The evaluation felt rushed. Also, there were duplicate questions in it.
This has been partially my mistake: I did not indicate what I wanted
to be removed.

- [ ] Remove duplicates in evaluation

All in all, I am fine with my teaching, but not impressed. Let's
do a score card, using the POET-O observation and
evaluation tool `[Jia et al., 2025]`:

<!-- markdownlint-disable MD013 --><!-- Tables cannot be split up over lines, hence will break 80 characters per line -->

No.|Grd|Facet
---|---|-----------------------------------
1  |7  |The lesson and learning activities are well organized
2  |8  |Planned student activities reflect appropriate lesson objectives
3  |6  |Depth and breadth of material presented appears appropriate to type of course, student level, and time dedicated to the topic
4  |9  |Learning activities provide opportunities for interaction that support active learning
5  |8  |Appropriate amount of content and course requirements are delivered
6  |NA |Discussion forum is interactive
7  |NA |Discussion forum and other learning tools promote critical thinking
8  |8  |The instructor effectively uses audio/visual learning tools and technologies to support the learning objectives or competencies
9  |8  |Learning tools and technologies used promote learner engagement and active learning
10 |8  |Learning tools and technologies required in the module/unit are provided and/or readily obtainable
11 |8  |Access to links and external resources provided are functional
12 |8  |Learning tools and technologies used are current
13 |7  |Presentation and organization of materials facilitate ease of use
14 |8  |Information is provided regarding accessibility of all learning tools and technologies required in the lesson
15 |1  |Alternative means of access to lesson materials in formats that meet the needs of diverse learners are provided
16 |7  |All materials are designed to facilitate readability
17 |1  |Planned assessment strategies measure the stated learning objectives or competencies
18 |1  |Specific and descriptive criteria are provided for the evaluation of learners’ work, i.e. rubrics etc
19 |5  |Students are given ample time to complete the assignments and assessments for this lesson
20 |8  |Instructor provides an overview of what is planned for the lesson
21 |7  |Instructor appears well prepared for lesson
22 |8  |Instructor establishes the relevance of information
23 |8  |Lesson content is up to date and there is evidence that instructor is knowledgeable about topics presented
24 |7  |Content is explained clearly, providing examples when appropriate
25 |8  |Instructor makes connections with prior learning (from previous lessons and courses) when applicable
26 |8  |Instructor facilitates productive discussions related to content
27 |4  |Instructor encourages critical thinking and expression of divergent opinions or conflicting views when appropriate
28 |8  |Instructor contributes to discussion, providing encouragement, reflection, and corrective feedback
29 |8  |Instructor provides periodic summaries of the most important ideas and ties things together at the end of the lesson
30 |8  |Instructor uses active learning techniques
31 |8  |Instructor treats students respectfully, offering encouragement in public ways and does not criticize student publicly
32 |4  |Instructor utilizes diverse methods of instruction to accommodate all learners

An average of 6.7 out of 10 seems to align with how I feel the lesson went.

## References

- `[Jia et al., 2025]` Jia, Yuane, et al.
  "Validation of a peer observation and evaluation tool for online teaching
  in the US: Y. Jia et al."
  Educational technology research and development 73.1 (2025): 615-639.
