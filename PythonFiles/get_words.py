import nltk
# nltk.download('wordnet')
import random
from nltk.corpus import wordnet as wn

def main():
    get_words()

def get_words():
    # result = []
    synsets = list(wn.all_synsets())

    count = 0
    while count < 5:
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

        # result.append(random_word, synonyms, antonyms)
        print(random_word)
        print(set(synonyms))
        print(set(antonyms))

        count += 1

    # return result

if __name__ == "__main__":
    main()