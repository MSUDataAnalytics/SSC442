<!-- slide -->

# Randomness and Data Analytics

### (and the fabulous importance of probabilistic inference)

<!-- slide -->

### Today

This lecture is very "high-level"; but that also means it's quite important.

We want to discuss **why** we eventually will need to utilize tons of difficult mathematics. Why do we care so much about hypothesis tests and the like?

Moreover, we can highlight why we want our data structured to behave nicely.

<!-- slide -->
# Group Projects

As previousy mentioned, your "final" is a group project.

Accordingly, you need to start planning relatively soon.

To aid your planning, here are the required elements of that project:

1. You must find existing data to analyze. Aggregating data from multiple sources encouraged but not required.
2. You must visualize 3 interesting features of that data.
3. You must come up with some analysis---using tools from the course---which relates your data to either a prediction or a policy conclusion.
4. You must present your analysis as if presenting to a C-suite executive.

<!-- slide -->
# Teams

You must let me know your team decision by this Sunday. This will allow us to assign teams by next Tuesday. To do this, please answer to survey at the link at the top of this webpage.

If you fail to report your team, then you will be added to the "willing to be randomly assigned" pool.


<!-- slide -->
# More on Teams

- You should strongly consider coordinating your work via Github.
- Your team will earn the same scores on all projects.
- Teams will only submit one write-up for the two mini-projects and the final project.

To combat additional freeloading, we will use a reporting system. See the course website for more details.

<!-- slide -->
# Learning from Data

The following are the basic requirements for statistical learning:

1. A pattern exists.
2. This pattern is not easily expressed in a closed mathematical form.
3. You have data.

<!-- slide -->
# Formalization

We think of our outcome-of-interest as a **response** or **target** that we wish to predict or wish to learn something about.

We generically refer to the response as $Y$.

Other aspects of the data are known as **features**, **inputs**, **predictors**, or **regressors**. We call one of these $X_i$.

We can refer to the input vector collectively as

$$X = \begin{bmatrix} x_{11} & x_{12}\\
x_{21} & x_{22} \\
x_{31} & x_{32} \\
\vdots & \vdots
\end{bmatrix}$$

We are seeking some unknow function that maps $X$ to $Y$.

Put another way, we are seeking to explain $Y$ as follows:
\[
Y = f (X) + \epsilon
\]

<!-- slide -->
# Formalization

We call the function $f : \mathcal{X} \to \mathcal{Y}$ the **target function**.

The target function is **always unknown**. It is the object of learning.

### Methodology:
- Observe data $(x_1, y_1) \dots (x_N, y_N)$.
- Use some algorithm to approximate $f$.
- Produce final hypothesis function $g \approx f$.
- Evaluate how well $g$ approximates $f$; iterate as needed.


<!-- slide -->
# Why estimate an unknown function?

With a good estimate of $f$ we can make predictions of $Y$ at new points $X = x$.

We can understand which components of $X = (X_1, X_2, \dots , X_m)$ are important in explaining $Y$ , and which are (potentially) irrelevant.

- e.g., `GDP` and `yearsindustrialized` have a big impact on `emissions`, but `hydroutilization` typically does not.

Depending on the complexity of $f$, we may be able to meaningfully understand how each component of $X$ affects $Y$.

(But we should be careful about assigning causal interpretations; more on this later)


<!-- slide -->

# The Parable of the Marbles

Within this bag of marbles are $\clubsuit$ and $\diamondsuit$ marbles

We are going to pick a sample of $n$ marbles (with replacement).

<!-- slide -->
# The Parable of the Marbles

- Let $\mu$ be the **objective** probability to pick a $\clubsuit$.
- Let $\nu$ be fraction of $\clubsuit$ marbles in the sample.

**Question:** Can we say anything about $\mu$ (outside the data) after observing $\nu$ (the data)?

- No. It is possible for the sample to be all $\clubsuit$ marbles and the bag to be $\approx \diamondsuit$. Consider a sample composed of  $~\clubsuit~\clubsuit~\clubsuit~\clubsuit~\clubsuit$. We can never rule out the possibility of drawing $\diamondsuit$!

**Question:** Then why do we do polling (e.g. to predict the outcome of the presidential election)?
- The bad case is *possible*, but not **probable**.

<!-- slide -->

# Outside the Data

Put another way, since $f$ is unknown, it can take on any value outside the data, no matter how large the data.

- This is called *No Free Lunch*.

You cannot know anything for sure about $f$ outside the data without making assumptions.

Is there any hope to know anything about $f$ outside the data set without making assumptions about $f$?

**Yes**, if we are willing to give up the "for sure."

<!-- slide -->

# Hoeffding's Inequality

**Hoeffding's Inequality** states, loosely, that $\nu$ cannot be too far from $\mu$.

### Theorem (Hoeffding's Inequality)
$$
\mathbb{P} \left [ | \nu - \mu |  > \epsilon \right ] \leq  2 e^{-2\epsilon^2 n}
$$

$\nu \approx \mu$ is called **probably approximately correct** (PAC-learning)

<!-- slide -->
# Hoeffding's Inequality: Example
**Example:** $n = 1, 000$; draw a sample and observe $\nu$.


- 99\% of the time $\mu - 0.05 \leq \nu \leq \mu + 0.05$
- (This is implied from setting $\epsilon = 0.05$ and using given $n$)
- 99.9999996\% of the time $\mu - 0.10 \leq \nu \leq \mu + 0.10$ %


**What does this mean?**

If I repeatedly pick a sample of size 1,000, observe $\nu$ and claim that
$\mu \in  [\nu - 0.05, \nu + 0.05]$ (or that the error bar is $\pm 0.05$) I will be right 99\% of the time.

On any particular sample you may be wrong, but not often.
