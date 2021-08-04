# Week 2 Quest 1
- `W2Q1` – Access Control Party [See Answers](#answers)

Look at the w2q1 folder. For this quest, you will be looking at 4 variables (a, b, c, d) and 3 functions (publicFunc, privateFunc, contractFunc) defined in some_contract.cdc. You will see I've marked 4 different areas (#1, #2, #3 in some_contract.cdc, and #4 in some_script.cdc) where I want you to answer the following task: For each variable (a, b, c, and d), tell me in which areas they can be read (read scope) and which areas they can be modified (write scope). For each function (publicFunc, contractFunc, and privateFunc), simply tell me where they can be called.

Ex. In Area 1:

1. Variables that can be read: a and c.
2. Variables that can be modified: d.
3. Functions that can be accessed: publicFunc and privateFunc
   Note: this is very wrong ^, haha!

# Answers

## Area 1:

| Vars | Read | Modified |
| ---- | ---- | -------- |
| a    | ✅   | ✅       |
| b    | ✅   | ✅       |
| c    | ✅   | ✅       |
| d    | ✅   | ✅       |


| Functions |
|-----------|
| publicFunc |
| contractFunc |
| privateFunc |

## Area 2:

| Vars | Read | Modified |
| ---- | ---- | -------- |
| a    | ✅   | ✅       |
| b    | ✅   | ❌       |
| c    | ✅   | ❌       |
| d    | ❌   | ❌       |


| Functions |
|-----------|
| publicFunc |
| contractFunc |

## Area 3:

| Vars | Read | Modified |
| ---- | ---- | -------- |
| a    | ✅   | ✅       |
| b    | ✅   | ❌       |
| c    | ✅   | ❌       |
| d    | ❌   | ❌       |


| Functions |
|-----------|
| publicFunc |
| contractFunc |

## Area 4:

| Vars | Read | Modified |
| ---- | ---- | -------- |
| a    | ✅   | ✅       |
| b    | ✅   | ❌       |
| c    | ❌   | ❌       |
| d    | ❌   | ❌       |


| Functions |
|-----------|
| publicFunc |
