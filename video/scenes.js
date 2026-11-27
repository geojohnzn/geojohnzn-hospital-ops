// Product demo of the Hospital Ops Demo Suite. Each screen is a real recording
// of the demo page (recordings/*.json); each step lands on its [#marker] in script.md.
const URL = 'hospital-ops.demo';
const screen = (name) => (s) => { s.recording(name, { frame: 'browser', url: URL, enter: 'none' }); };

export default {
  intro(s) {
    const { top, h } = s.safe;
    s.title('Hospital Ops', { y: top + h * 0.36, size: 120, at: -1 });
    s.text('One system for a multispecialty hospital', { y: top + h * 0.54, size: 54, color: 'accent', at: 0.3 });
    s.text('Records · Clinics · Beds · Scribe · Quality · Operations', { y: top + h * 0.68, size: 38, color: 'muted', at: 'Records' });
  },

  overview: screen('overview'),
  clinics: screen('clinics'),
  scribe: screen('scribe'),
  quality: screen('quality'),
  journey: screen('journey'),
  forecast: screen('forecast'),

  outro(s) {
    const { top, h } = s.safe;
    s.title('Hospital Ops', { y: top + h * 0.4, size: 110, at: 0 });
    s.text('Synthetic demo data · ready for a pilot', { y: top + h * 0.58, size: 50, color: 'muted', at: 'Ready' });
  },
};
