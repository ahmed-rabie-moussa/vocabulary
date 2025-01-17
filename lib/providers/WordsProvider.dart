import 'dart:math';

import 'package:flutter/material.dart';

class WordsProvider with ChangeNotifier {

  List<Map<String, String>> words = [
    {
      "word": "Poppycock",
      "pronunciation": "popj.kok",
      "part_of_speech": "n.",
      "definition": "Nonsense or foolishness",
      "example": "His excuses for being late were nothing but poppycock."
    },
    {
      "word": "Serendipity",
      "pronunciation": "ser.uhn.dip.i.tee",
      "part_of_speech": "n.",
      "definition": "The occurrence of events by chance in a happy or beneficial way",
      "example": "Finding a \$20 bill on the street was a moment of serendipity."
    },
    {
      "word": "Ephemeral",
      "pronunciation": "ih.fem.er.uhl",
      "part_of_speech": "adj.",
      "definition": "Lasting for a very short time",
      "example": "The beauty of the sunset was ephemeral."
    },
    {
      "word": "Quintessential",
      "pronunciation": "kwin.tuh.sen.shuhl",
      "part_of_speech": "adj.",
      "definition": "Representing the most perfect or typical example of a quality or class",
      "example": "She is the quintessential professional."
    },
    {
      "word": "Melancholy",
      "pronunciation": "mel.uhn.kol.ee",
      "part_of_speech": "n.",
      "definition": "A feeling of pensive sadness, typically with no obvious cause",
      "example": "He felt a deep sense of melancholy after the movie."
    },
    {
      "word": "Eloquence",
      "pronunciation": "el.uh.kwuhns",
      "part_of_speech": "n.",
      "definition": "Fluent or persuasive speaking or writing",
      "example": "Her eloquence captivated the audience."
    },
    {
      "word": "Resilience",
      "pronunciation": "ri.zil.yuhns",
      "part_of_speech": "n.",
      "definition": "The capacity to recover quickly from difficulties",
      "example": "The resilience of the community after the disaster was inspiring."
    },
    {
      "word": "Ineffable",
      "pronunciation": "in.ef.uh.buhl",
      "part_of_speech": "adj.",
      "definition": "Too great or extreme to be expressed in words",
      "example": "The ineffable beauty of the landscape left us speechless."
    },
    {
      "word": "Surreptitious",
      "pronunciation": "sur.uhp.tish.uhs",
      "part_of_speech": "adj.",
      "definition": "Kept secret, especially because it would not be approved of",
      "example": "He took a surreptitious glance at his notes during the test."
    },
    {
      "word": "Pernicious",
      "pronunciation": "per.nish.uhs",
      "part_of_speech": "adj.",
      "definition": "Having a harmful effect, especially in a gradual or subtle way",
      "example": "The pernicious influence of gossip can ruin reputations."
    },
    {
      "word": "Alacrity",
      "pronunciation": "uh.lak.ri.tee",
      "part_of_speech": "n.",
      "definition": "Brisk and cheerful readiness",
      "example": "She accepted the invitation with alacrity."
    },
    {
      "word": "Sycophant",
      "pronunciation": "sik.uh.fant",
      "part_of_speech": "n.",
      "definition": "A person who acts obsequiously toward someone important in order to gain advantage",
      "example": "The manager was surrounded by sycophants who agreed with everything he said."
    },
    {
      "word": "Cacophony",
      "pronunciation": "kuh.kof.uh.nee",
      "part_of_speech": "n.",
      "definition": "A harsh, discordant mixture of sounds",
      "example": "The cacophony of the city streets was overwhelming."
    },
    {
      "word": "Epiphany",
      "pronunciation": "ih.pif.uh.nee",
      "part_of_speech": "n.",
      "definition": "A moment of sudden and great revelation or realization",
      "example": "She had an epiphany about her career while on vacation."
    },
    {
      "word": "Ostentatious",
      "pronunciation": "os.ten.tay.shuhs",
      "part_of_speech": "adj.",
      "definition": "Characterized by vulgar or pretentious display; designed to impress or attract notice",
      "example": "The ostentatious display of wealth made everyone uncomfortable."
    },
    {
      "word": "Mellifluous",
      "pronunciation": "muh.lif.loo.uhs",
      "part_of_speech": "adj.",
      "definition": "Sweet or musical; pleasant to hear",
      "example": "Her mellifluous voice was perfect for the radio."
    },
    {
      "word": "Ebullient",
      "pronunciation": "ih.bool.yuhnt",
      "part_of_speech": "adj.",
      "definition": "Cheerful and full of energy",
      "example": "His ebullient personality made him popular at parties."
    },
    {
      "word": "Nefarious",
      "pronunciation": "nih.fair.ee.uhs",
      "part_of_speech": "adj.",
      "definition": "Wicked or criminal",
      "example": "The nefarious activities of the gang were finally exposed."
    },
    {
      "word": "Fastidious",
      "pronunciation": "fas.tid.ee.uhs",
      "part_of_speech": "adj.",
      "definition": "Very attentive to and concerned about accuracy and detail",
      "example": "She was fastidious about her appearance."
    },
    {
      "word": "Quixotic",
      "pronunciation": "kwik.sot.ik",
      "part_of_speech": "adj.",
      "definition": "Exceedingly idealistic; unrealistic and impractical",
      "example": "His quixotic quest for perfection often led to disappointment."
    },
    {
      "word": "Sanguine",
      "pronunciation": "san.gwin",
      "part_of_speech": "adj.",
      "definition": "Optimistic or positive, especially in an apparently bad or difficult situation",
      "example": "Despite the setbacks, she remained sanguine about the project."
    },
    {
      "word": "Lugubrious",
      "pronunciation": "loo.goo.bree.uhs",
      "part_of_speech": "adj.",
      "definition": "Looking or sounding sad and dismal",
      "example": "The lugubrious tone of the music matched the somber mood of the film."
    },
    {
      "word": "Esoteric",
      "pronunciation": "es.uh.ter.ik",
      "part_of_speech": "adj.",
      "definition": "Intended for or likely to be understood by only a small number of people with a specialized knowledge or interest",
      "example": "The professor's lecture on quantum physics was esoteric."
    },
    {
      "word": "Iconoclast",
      "pronunciation": "eye.kon.uh.klast",
      "part_of_speech": "n.",
      "definition": "A person who attacks cherished beliefs or institutions",
      "example": "The artist was known as an iconoclast for his controversial works."
    },
    {
      "word": "Ostensible",
      "pronunciation": "os.ten.suh.buhl",
      "part_of_speech": "adj.",
      "definition": "Stated or appearing to be true, but not necessarily so",
      "example": "The ostensible reason for the meeting was to discuss the budget."
    },
    {
      "word": "Pragmatic",
      "pronunciation": "prag.mat.ik",
      "part_of_speech": "adj.",
      "definition": "Dealing with things sensibly and realistically in a way that is based on practical rather than theoretical considerations",
      "example": "Her pragmatic approach to problem-solving was effective."
    },
    {
      "word": "Magnanimous",
      "pronunciation": "mag.nan.uh.muhs",
      "part_of_speech": "adj.",
      "definition": "Generous or forgiving, especially toward a rival or less powerful person",
      "example": "The magnanimous victor offered to help his defeated opponent."
    },
    {
      "word": "Ubiquitous",
      "pronunciation": "yoo.bik.wi.tuhs",
      "part_of_speech": "adj.",
      "definition": "Present, appearing, or found everywhere",
      "example": "Smartphones have become ubiquitous in modern society."
    },
    {
      "word": "Vicarious",
      "pronunciation": "vai.kair.ee.uhs",
      "part_of_speech": "adj.",
      "definition": "Experienced in the imagination through the feelings or actions of another person",
      "example": "She lived vicariously through her daughter's adventures."
    }
  ];

  // Randomly select 5 words
  List<Map<String, String>> getRandomWords() {
    final random = Random();
    final shuffledWords = List.of(words)..shuffle(random);
    return shuffledWords.take(5).toList();
  }

}
