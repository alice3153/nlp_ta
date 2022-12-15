# 준비하기

## 패키지 로드하기
library(tidyverse)
library(bitTA)
library(tidytext)

data(president_speech)

## 데이터셋 분리
library(tidymodels)

set.seed(123)
president_split <- rsample::initial_split(president_speech, prop = 7/8, strata = president)

president_smpl <- rsample::testing(president_split)

set.seed(123)
president_split <- initial_split(president_smpl, prop = 0.7, strata = president)

train <- rsample::training(president_split)
test <- rsample::testing(president_split)

# 띄어쓰기 단위로 토큰을 생성
library(text2vec)
token_fun <- text2vec::word_tokenizer

it_train <- itoken(train$doc, 
                   tokenizer = token_fun, 
                   ids = train$id, 
                   progressbar = FALSE)

it_test <- itoken(test$doc,
                  tokenizer = token_fun, 
                  ids = test$id, 
                  progressbar = FALSE)


1. DTM 생성

library(tidyverse)
library(tidymodels)
library(text2vec)
library(glmnet)
library(caret)
library(bitTA)

## 

president_test <- bitTA::president_speech %>% 
  mutate(label = factor(ifelse(label  == 0, "Negative", "Positive")))

set.seed(123)
president_split <- rsample::initial_split(president_test, prop = 3/5, strata = label)

sample_30000 <- rsample::training(president_split)

set.seed(123)
president_split <- rsample::initial_split(sample_30000, prop = 2/3, strata = label)

train <- rsample::training(president_split)
test <- rsample::testing(president_split)

train %>% 
  count(label) 

test %>% 
  count(label) 

# TF 기반

## tokenize 반복기 정의

