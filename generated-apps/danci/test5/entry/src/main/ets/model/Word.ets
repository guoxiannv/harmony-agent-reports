// Word.ets
//
// Core vocabulary entity for the kids' word-review app.
// One Word = one flashcard (front: English word, back: Chinese meaning + phonetic).

export interface Word {
  id: string;
  word: string;
  meaning: string;
  phonetic: string;
}
