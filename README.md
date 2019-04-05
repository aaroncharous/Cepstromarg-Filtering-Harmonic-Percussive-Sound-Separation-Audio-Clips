# Cepstromarg Filtering and Harmonic/Percussive Source Separation Examples

There are seven files for an example of musical source separation.
1. piano_percussion.wav is a mix of piano and percussion create in GarageBand for testing source separation.
2. harmonicRecoveredWithoutVocal.wav is the harmonic source (piano) extracted from piano_percussion.wav using single-stage cepstromarg filtering
3. percussionRecoveredWithoutVocal.wav is the percussive source extracted from piano_percussion.wav using single-stage cepstromarg filtering

4. piano_perc_vocal_mixed.wav is a mix of piano, percussion, and vocals (with amplitudes remixed differently from piano_percussion.wav)
5. harmonicRecoveredWithVocal.wav is the harmonic source (piano) extracted from piano_perc_vocal_mixed.wav using a cascaded system: one stage of cepstromarg filtering followed by an HPSS algorithm proposed by Tachibana et al. [1] to separate the vocals and harmonics.
6. percussionRecoveredWithVocal.wav is the percussion extracted from piano_perc_vocal_mixed.wav using a single stage of cepstromarg filtering (all of the percussion is extracted in the first stage of the cascaed system)
7. vocalRecoveredWithVocal.wav is the vocals extracted ffrom piano_perc_vocal_mixed.wav using a cascaded system: one stage of cepstromarg filtering followed by an HPSS algorithm proposed by Tachibana et al. [1] to separate the vocals and harmonics.


Also in the repository is MATLAB code to generate the audio files.  cfSingleStage.m is the main script that calls everything else, so one could just run that. In that script, percFinal is the separated percussion audio, harmFinal is the vocals and harmonics mixed (from the first stage of cepstromarg filtering), xha is the separated harmonic audio from the second stage of HPSS, and xva is the separated vocal audio from the second stage of HPSS.


To see how cepstromarg filtering is done, check out my undergraduate thesis!  **citation coming soon**




[1] Hideyuki   Tachibana   et   al.   “Harmonic/Percussive   Sound   Separation   Based   onAnisotropic  Smoothness  of  Spectrograms”.  In:IEEE/ACM  Transactions  on  Audio, Speech,  and  Language  Processing 22.12 (Dec. 2014), pp. 2059–2073. issn: 2329-9290.doi:10.1109/TASLP.2014.2351131.
