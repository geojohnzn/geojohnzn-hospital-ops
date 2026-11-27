# Hospital Ops demo suite

A demo hospital system for a multispecialty hospital in Abu Dhabi. All patients,
staff and figures are **synthetic**. Never enter real patient information.

- **Live demo (private):** https://claude.ai/artifact/WmB3iHir8FPAR5bGuHeUHU
- **Source:** [`app/index.html`](app/index.html), one self-contained page
- **Demo video project:** [`video/`](video/), made with [explainroo](https://www.explainroo.com/docs/)

## What is in the demo

| Module | Status |
| --- | --- |
| Medical scribe | **Working.** It drafts a SOAP note with ICD-10-CM and CPT suggestions, each linked to the supporting words. The doctor edits and signs. The AI runs only inside claude.ai (the `sample` capability). Elsewhere, the page shows a pre-written example for the sample conversation. |
| Jawda indicators | **Working calculation engine.** It loads messy CSV, Excel or JSON and auto-matches the columns. It calculates the eight Jawda V9 infection indicators and 13 other measures by quarter, plus a monthly chart with an expected range. It has a built-in self-check (`window.__selfTest`). |
| Patients, clinics, bed board | Simulated, clickable, in memory. Resets on reload. |
| Executive overview | Simulated data. |
| Patient journey, forecast | Simulated projections. |

Jawda V9 (2026) publishes direction only, with no numeric targets. Reference rates
come from the first UAE national HAI report (2023 data) and NHSN pooled means.

## Change the demo

Edit `app/index.html`, then republish it to the same claude.ai link (ask Claude to
"republish the demo to the same link"). To rebrand for a client, change the
`HOSPITAL` constant near the top of the script.

## Re-make the video

The six screen recordings are kept in `video/assets/recordings/`, so wording or
voice changes don't need new recordings.

```bash
cd video
npx --yes explainroo doctor --fetch
```

```bash
npx --yes explainroo voice .
```

```bash
npx --yes explainroo render .
```

The video is written to `video/out/video.mp4`, which is not committed.

The voice and speech models download from Hugging Face (`huggingface.co` and
`us.aws.cdn.hf.co`), so the cloud environment must allow those hosts. The
`hospital-demo` environment does.

To **re-record a screen** after changing the page, serve a local copy (the page's
chart libraries load from cdnjs, which the recording browser may not reach):

```bash
./video/serve-local.sh
```

Then, in another terminal, from `video/`:

```bash
npx --yes explainroo record . scribe
```

Replace `scribe` with any file name in `video/recordings/`.
