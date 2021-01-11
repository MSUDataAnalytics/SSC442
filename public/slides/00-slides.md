<!-- slide -->
# Introduction to SSC442


$~$
> I keep saying that the sexy job in the next 10 years will be statisticians. And I'm not kidding.



$~$
### Hal Varian, Chief Economist, Google

<!-- slide -->

# Introduction: About Me

**Me:** My primary area of expertise is environmental and energy (applied) economics.

This class is totally, unapologetically a work in progress. It was developed mainly by Prof. Bushong with refinements by myself.

Material is a mish-mash of stuff from courses offered at Caltech, Stanford, Harvard, and Duke...so, yeah, it will be challenging. Hopefully, you'll find it fun!

My research: occasionally touches the topics in the course, but mostly utilizes things in the course as tools.

<!-- slide -->
# Introduction: About You

*New phone who dis?*  Please email me jkirk\@msu.edu your
- name (with pronunciation guide)
- major
- desired graduation year and semester
- interest in this course on a 10-point scale (1: not at all interested; 10: helllllll yeah)

You **must** spend 5 minutes emailing me a little bit about your interests before the next class.

<!-- slide -->

### https://ssc442kirkpatrick.netlify.app

<!-- slide -->

# Introduction: This Course

The syllabus is posted on the course website. I'll walk through highlights now, but read it later -- it's long.
- But eventually, please read it. It is "required."

	Syllabus highlights:

- Grade is composed of weekly writings, labs, and projects.
  - Weekly writings: 22\%
  - Participation: 4\%
  - Labs: 29\%
  - Projects: 45\%

- This structure is designed to give ~55\% "for free". Success on the projects will require real work.
- Labs consist of a practical implementation of something we've covered in the course (e.g., code your own Recommender System).

<!-- slide -->

# Introduction: This Course

Grading: **come to class.**

**If** you complete all assignments and attend all class dates, I suspect you will do very well. Given the way the syllabus is structured, I conjecture that the following is a loose guide to grades:

`4.0` Turned in all assignments with good effort, worked hard on the projects and was proud of final product.

`3.5` Turned in all assignments with good effort, worked a bit on the projects and was indifferent to final product.

`3.0` Turned in all assignments with some effort, worked a bit on the projects and was shy about final product.

`< 3.0` Very little effort, or did not turn in all assignments, worked very little on the projects and was embarassed by final product.

...of course, failing to turn in assignments can lead to a grade dramatically **lower** than just a 3.0.

<!-- slide -->

# Introduction: This Course

There are sort of three texts for this course and sort of zero.

The "main text" is free and available online. The secondary text is substantially more difficult, but also free online. The third text costs about \$25. Assigned readings can be found on the course website under "Content".

**Please please please please please:** Ask questions during class via chat.
- Most ideas will be new.
- Sometimes (often?) the material itself will be confusing or interesting---or both!
- Teaching online is incredibly challenging (no feedback) and chat is vital to success.
- **Note:** If I find that attendance is terrible, I may have to start incorporating attendance into participation.

Return of the Please: If there is some topic that you really want to learn about, ask. If you are uncomfortable asking in front of the whole group, please see me during office hours.

<!-- slide -->

# Introduction: This Course

Because this is a new course:

- Some of the lectures will be way too long or too short.

- Some (most?) of the lectures won't make sense.

- Some of the time I'll forget what I intended to say and awkwardly stare at you for a few moments (sorry).

Comment **throughout** the course, not just at the end.


The material will improve with time and feedback.


I encourage measured feedback and thoughtful responses to questions. If I call on you and you don't know immediately, don't freak out. If you don't know, it's totally okay to say you don't know.

<!-- slide -->

# Introduction: This Course

### SUPER BIG IMPORTANT EXPLANATION OF THE COURSE


I teach using ``math''.

...Don't be afraid. The math won't hurt you.

I fundamentally believe that true knowledge of how we learn from data depends on a basic understanding of the underlying mathematics.

-Good news: no black boxes.
  - You'll **actually learn** stuff. (Probably. Hopefully?)
- Also good news: level of required math is reasonably low. High-school algebra or equivalent should be fine.

-Bad news: notation-heavy slides and reading.

<!-- slide -->

# Introduction: This Course

Finally: I cannot address field-specific questions in areas outside economics to any satisfying degree.

Good news: I'm good at knowing what I don't know and have a very small ego, which means that I'm much less likely to blow smoke up your ass than other professors.

Bad news: I can't help with certain types of questions.

This course should be applicable broadly, but many of the examples will lean on my personal expertise (sorry).

<!-- slide -->

# Last Intro Slide

Your assignment: read syllabus the content from Week 0.

Things to stress from syllabus:

- E-mail isn't the ideal solution for technical problems
- No appointments necessary for regularly scheduled office hours; or by appointment.
- TA office hours are great as well. Our TA has experience in this course.
- Can only reschedule exams (with good reason) if you tell me **before** the exam that you have a conflict.
  - Notify me immediately if you need accommodations because of RCPD or religious convictions; If you approach me at the last minute, I may not be able to help.

Despite my hard-assness in these intro slides: I'm here to help and I am not in the business of giving bad grades for no reason.

<!-- slide -->

# What is "Data Analytics"?

How do **you** define "data analytics"?  (Not a rhetorical question!)

- This course will avoid this nomenclature. It is confusing and imprecise. But you signed up (suckers) and I owe an explanation of what this course will cover.

Some "data analytics" topics we will cover:

- Linear regression: *il classico*.
- Models of classification or discrete choice.
- Analysis of ``wide'' data.
- Decision trees and other non-linear models.

<!-- slide -->
## Starting point for this course

Better utilizing existing data can improve our predictive power whilst providing interpretable outputs for considering new policies.

**WARNING:** Causation is tough and we will spend the entire course warning you to avoid making causal claims!

<!-- slide -->

# Outline of the Course


<!-- slide -->

## Non-Social Science Approaches to Statistical Learning
### A Brief History

Suppose you are a researcher and you want to teach a computer to recognize images of a tree.

Note: this is an ``easy" problem. If you show pictures to a 3-year-old, that child will probably be able to tell you if there is a tree in the picture.

Computer scientists spent about 20 years on this problem because they thought about the problem like nerds and tried to write down a series of rules.

Rules are difficult to form, and simply writing rules misses the key insight: the data can tell you something.

<!-- slide -->

## Social Science Approaches to Statistical Learning
### A Brief History

Suppose you are a researcher and you want to know whether prisons reduce crime.


from ``A Call for a Moratorium on Prison Building'' (1976)

- Between 1955 and 1975, fifteen states increased the collective capacity of their adult prison systems by 56\% (from, on average, 63,100 to 98,649).
- Fifteen other states increased capacity by less than 4\% (from 49,575 to 51,440).
- In "heavy-construction" states the crime rate increased by 167\%; in "low-construction" states the crime rate increased by 145\%.

| | Prison Capacity | Crime Rate
| --- | --- | --- |
High construction | $\uparrow$~56\% | $\uparrow$~167\%
Low construction | $\uparrow$~4\% | $\uparrow$~145\%

<!-- slide -->
# The Pros and Cons of Correlation

Pros:
  - Nature gives you correlations for free.
  - In principle, everyone can agree on the facts.

Cons:
  - Correlations are not very helpful.
  - They show what has happened, but not why.
  - For many things, we care about why.

<!-- slide -->
## Why a Correlation Exists Between X and Y

1. $X \rightarrow Y$
  X causes Y (causality)

2. $X \leftarrow Y$
  Y causes X (reverse causality)

3. $Z \rightarrow X$; $Z \rightarrow Y$
  Z causes X and Y (common cause)

4. $X \rightarrow Y$; $Y \rightarrow X$
  X causes Y and Y causes X (simultaneous equations)

<!-- slide -->
## Uniting Social Science and Computer Science

We will start in this course by examining situations where we do **not** care about why something has happened, but instead we care about our ability to predict its occurrence from existing data.

(But of course keep in back of mind that if you are making policy, you must care about why something happened).

We will also borrow a few other ideas from CS:
- Anything is data
  + Satellite data
  + Unstructured text or audio
  + Facial expressions or vocal intonations
- Subtle improvements on existing techniques
- An eye towards practical implementability over ``cleanliness"

<!-- slide -->
# A Case Study in Prediction

**Example:** a firm wishes to predict user behavior based on previous purchases or interactions.

Small margins $\rightarrow$ huge payoffs.  $10\% \rightarrow$ \$1 million.

Not obvious why this was true for Netflix; quite obvious why this is true in financial markets.

<!-- slide -->


### More Recent Examples of Prediction

- Identify the risk factors for prostate cancer.
- Classify a tissue sample into one of several cancer classes, based on a gene expression profile.
- Classify a recorded phoneme based on a log-periodogram.
- Predict whether someone will have a heart attack on the basis of demographic, diet and clinical measurements.
- Customize an email spam detection system.
- Identify a hand-drawn object.
- Determine which oscillations of stellar luminosity are likely due to exoplanets.
- Establish the relationship between salary and demographic variables in population survey data.

<!-- slide -->
# An Aside: Nomenclature

**Machine learning** arose as a subfield of Artificial Intelligence.

**Statistical learning** arose as a subfield of Statistics.

There is much overlap; however, a few points of distinction:

- Machine learning has a greater emphasis on large scale applications and prediction accuracy.

- Statistical learning emphasizes models and their interpretability, and precision and uncertainty.
  - But the distinction has become more and more blurred, and there is a great deal of "cross-fertilization".

**Obviously true:** machine learning has the upper hand in marketing.


<!-- slide -->
# Learning from Data

The following are the basic requirements for statistical learning:

1. A pattern exists.
2. This pattern is not easily expressed in a closed mathematical form.
3. You have data.
