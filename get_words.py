import nltk
import random
# nltk.download('wordnet')
from nltk.corpus import wordnet as wn

synsets = list(wn.all_synsets())

count = 0
while count < 4: # while the game is going
    random_synset = random.choice(synsets)
    random_word = random_synset.lemma_names()[0]

    synonyms = []
    antonyms = []

    for syn in wn.synsets(random_word):
        for l in syn.lemmas():
            if l.antonyms():
                if (len(antonyms) < 5):
                    antonyms.append(l.antonyms()[0].name())
            if (len(synonyms) < 5):
                synonyms.append(l.name())
    
    if (len(antonyms) == 0):
        continue

    print(random_word)
    print(set(synonyms))
    print(set(antonyms))

    count += 1