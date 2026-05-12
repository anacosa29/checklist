<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Painel do Mentor — Sociedade da Licitação</title>
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;900&family=Barlow:wght@400;500;600&display=swap" rel="stylesheet"/>
<style>
:root{
  --green:#22c55e;--green-dark:#16a34a;
  --green-glow:rgba(34,197,94,0.15);--green-dim:rgba(34,197,94,0.08);
  --black:#080808;--surface:#111111;--surface2:#1a1a1a;--surface3:#222;
  --border:rgba(255,255,255,0.07);--border-green:rgba(34,197,94,0.3);
  --text:#f0f0f0;--muted:#888;--muted2:#555;
  --yellow:rgba(234,179,8,0.9);--yellow-dim:rgba(234,179,8,0.08);--yellow-border:rgba(234,179,8,0.25);
}
*{margin:0;padding:0;box-sizing:border-box}
html,body{background:var(--black);font-family:'Barlow',sans-serif;color:var(--text);min-height:100vh}

.topbar{
  background:var(--surface);border-bottom:1px solid var(--border);
  padding:1rem 1.5rem;display:flex;align-items:center;gap:12px;
  position:sticky;top:0;z-index:100;
}
.logo-mark{
  width:36px;height:36px;background:var(--green);border-radius:6px;
  display:flex;align-items:center;justify-content:center;
  font-family:'Barlow Condensed',sans-serif;font-weight:900;font-size:18px;
  color:#000;letter-spacing:-1px;
}
.brand{font-family:'Barlow Condensed',sans-serif;font-weight:700;font-size:14px;line-height:1.1}
.brand small{font-size:11px;color:var(--muted);font-weight:400;display:block}
.mentor-badge{
  margin-left:auto;background:rgba(34,197,94,0.12);border:1px solid var(--border-green);
  color:var(--green);font-size:11px;font-weight:700;letter-spacing:0.08em;
  padding:4px 12px;border-radius:20px;text-transform:uppercase;
}

.page{padding:1.5rem;max-width:900px;margin:0 auto}
.page-title{
  font-family:'Barlow Condensed',sans-serif;font-weight:900;
  font-size:clamp(24px,4vw,36px);text-transform:uppercase;
  margin-bottom:4px;
}
.page-title span{color:var(--green)}
.page-sub{font-size:14px;color:var(--muted);margin-bottom:2rem;line-height:1.5}

/* STATS ROW */
.stats-row{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:10px;margin-bottom:2rem}
.stat-card{
  background:var(--surface);border:1px solid var(--border);
  border-radius:10px;padding:1rem;
}
.stat-val{
  font-family:'Barlow Condensed',sans-serif;font-weight:900;
  font-size:32px;color:var(--green);line-height:1;
}
.stat-label{font-size:12px;color:var(--muted);margin-top:4px}

/* STUDENTS */
.section-head{
  display:flex;justify-content:space-between;align-items:center;
  margin-bottom:12px;
}
.section-title{
  font-family:'Barlow Condensed',sans-serif;font-weight:700;
  font-size:18px;text-transform:uppercase;color:var(--muted);letter-spacing:0.05em;
}
.refresh-btn{
  font-size:12px;font-weight:600;padding:6px 14px;
  border:1px solid var(--border);border-radius:6px;
  background:none;color:var(--muted);cursor:pointer;
  font-family:'Barlow',sans-serif;transition:all 0.15s;
}
.refresh-btn:hover{border-color:var(--green);color:var(--green)}

.students-grid{display:flex;flex-direction:column;gap:8px;margin-bottom:2rem}
.student-row{
  background:var(--surface);border:1px solid var(--border);
  border-radius:10px;padding:14px 16px;
  display:flex;align-items:center;gap:14px;
  cursor:pointer;transition:border-color 0.15s;
}
.student-row:hover{border-color:rgba(255,255,255,0.15)}
.student-row.selected{border-color:var(--border-green)}
.avatar{
  width:38px;height:38px;border-radius:50%;
  background:var(--green-dim);border:1px solid var(--border-green);
  display:flex;align-items:center;justify-content:center;
  font-family:'Barlow Condensed',sans-serif;font-weight:700;
  font-size:14px;color:var(--green);flex-shrink:0;
}
.student-info{flex:1;min-width:0}
.s-name{font-size:14px;font-weight:600;margin-bottom:2px}
.s-meta{font-size:12px;color:var(--muted)}
.s-bar-wrap{width:100px;flex-shrink:0}
.s-bar-track{height:4px;background:var(--surface2);border-radius:2px;overflow:hidden;margin-bottom:3px}
.s-bar-fill{height:100%;background:var(--green);border-radius:2px}
.s-pct{font-family:'Barlow Condensed',sans-serif;font-weight:700;font-size:13px;color:var(--green);text-align:right}
.s-chevron{color:var(--muted2);flex-shrink:0}
.s-updated{font-size:11px;color:var(--muted2);white-space:nowrap}

/* DETAIL PANEL */
.detail-panel{
  background:var(--surface);border:1px solid var(--border-green);
  border-radius:12px;padding:1.5rem;display:none;margin-bottom:2rem;
}
.detail-panel.open{display:block}
.detail-header{
  display:flex;align-items:center;gap:12px;margin-bottom:1.5rem;
  padding-bottom:1rem;border-bottom:1px solid var(--border);
}
.detail-avatar{
  width:48px;height:48px;border-radius:50%;
  background:var(--green-dim);border:1px solid var(--border-green);
  display:flex;align-items:center;justify-content:center;
  font-family:'Barlow Condensed',sans-serif;font-weight:700;
  font-size:18px;color:var(--green);
}
.detail-name{font-family:'Barlow Condensed',sans-serif;font-weight:700;font-size:22px}
.detail-pct{
  margin-left:auto;
  font-family:'Barlow Condensed',sans-serif;font-weight:900;
  font-size:28px;color:var(--green);
}
.detail-steps{display:flex;flex-direction:column;gap:8px}
.detail-step{
  background:var(--surface2);border:1px solid var(--border);
  border-radius:8px;padding:12px 14px;
}
.detail-step.done{border-color:var(--border-green)}
.detail-step.in-progress{border-color:var(--yellow-border)}
.ds-row{display:flex;align-items:center;gap:10px}
.ds-dot{
  width:8px;height:8px;border-radius:50%;
  background:var(--muted2);flex-shrink:0;
}
.ds-dot.done{background:var(--green)}
.ds-dot.in-progress{background:var(--yellow)}
.ds-title{font-size:13px;font-weight:600;flex:1}
.ds-badge{
  font-size:11px;font-weight:600;padding:2px 9px;border-radius:20px;
}
.ds-badge.todo{background:var(--surface3);color:var(--muted)}
.ds-badge.done{background:var(--green-dim);color:var(--green)}
.ds-badge.in-progress{background:var(--yellow-dim);color:var(--yellow)}
.ds-note{
  font-size:12px;color:var(--muted);margin-top:8px;
  padding-top:8px;border-top:1px solid var(--border);
  line-height:1.5;font-style:italic;
}

/* EMPTY */
.empty{
  text-align:center;padding:3rem 1rem;
  color:var(--muted);
}
.empty-icon{font-size:40px;margin-bottom:12px;opacity:0.3}
.empty-text{font-size:14px;line-height:1.6}

/* LOADING */
.loading{
  text-align:center;padding:3rem;
  color:var(--muted);font-size:14px;
}
.spin{
  display:inline-block;width:20px;height:20px;
  border:2px solid var(--border);border-top-color:var(--green);
  border-radius:50%;animation:spin 0.7s linear infinite;
  vertical-align:middle;margin-right:8px;
}
@keyframes spin{to{transform:rotate(360deg)}}
</style>
</head>
<body>

<div class="topbar">
  <div class="logo-mark">SL</div>
  <div class="brand">Sociedade da Licitação<small>Pedrão da Licitação</small></div>
  <div class="mentor-badge">Painel Mentor</div>
</div>

<div class="page">
  <div class="page-title">Acompanhamento de <span>alunos</span></div>
  <p class="page-sub">Veja o progresso de cada aluno em tempo real. As anotações e status são atualizados sempre que o aluno salva.</p>

  <div class="stats-row" id="stats-row">
    <div class="stat-card"><div class="stat-val" id="stat-total">—</div><div class="stat-label">Alunos ativos</div></div>
    <div class="stat-card"><div class="stat-val" id="stat-done">—</div><div class="stat-label">Concluíram 100%</div></div>
    <div class="stat-card"><div class="stat-val" id="stat-avg">—</div><div class="stat-label">Progresso médio</div></div>
    <div class="stat-card"><div class="stat-val" id="stat-active">—</div><div class="stat-label">Em andamento</div></div>
  </div>

  <div class="section-head">
    <div class="section-title">Alunos</div>
    <button class="refresh-btn" onclick="loadStudents()">↻ Atualizar</button>
  </div>

  <div id="students-container" class="students-grid">
    <div class="loading"><span class="spin"></span>Carregando alunos...</div>
  </div>

  <div class="detail-panel" id="detail-panel">
    <div class="detail-header">
      <div class="detail-avatar" id="d-avatar"></div>
      <div>
        <div class="detail-name" id="d-name"></div>
        <div style="font-size:12px;color:var(--muted)" id="d-updated"></div>
      </div>
      <div class="detail-pct" id="d-pct"></div>
    </div>
    <div class="detail-steps" id="d-steps"></div>
  </div>
</div>

<script>
const STEPS = [
  {id:'cnpj',title:'CNPJ e situação cadastral'},
  {id:'sicaf14',title:'SICAF — Níveis I ao IV'},
  {id:'sicaf56',title:'SICAF — Níveis V e VI'},
  {id:'nicho',title:'Escolha do nicho'},
  {id:'captacao',title:'Captação de editais'},
  {id:'cotacao',title:'Cotação de preços'},
  {id:'proposta',title:'Cadastro da proposta'},
  {id:'lances',title:'Fase de lances e entrega'}
];

function initials(name){
  return name.split(' ').slice(0,2).map(w=>w[0]||'').join('').toUpperCase();
}
function timeAgo(ts){
  const d = Date.now()-ts;
  if(d<60000) return 'agora mesmo';
  if(d<3600000) return Math.floor(d/60000)+'min atrás';
  if(d<86400000) return Math.floor(d/3600000)+'h atrás';
  return Math.floor(d/86400000)+'d atrás';
}

let allStudents = [];
let selectedId = null;

async function loadStudents(){
  const container = document.getElementById('students-container');
  container.innerHTML = '<div class="loading"><span class="spin"></span>Carregando...</div>';
  
  try {
    const keys = await window.storage.list('sl_progress_', true);
    if(!keys || !keys.keys || keys.keys.length===0){
      container.innerHTML = `<div class="empty"><div class="empty-icon">📋</div><div class="empty-text">Nenhum aluno registrou progresso ainda.<br>Compartilhe o <strong>checklist.html</strong> com seus alunos.</div></div>`;
      updateStats([]);
      return;
    }
    
    const students = [];
    for(const key of keys.keys){
      try {
        const r = await window.storage.get(key, true);
        if(r){
          const data = JSON.parse(r.value);
          const done = Object.values(data.steps||{}).filter(s=>s.status==='done').length;
          const pct = Math.round(done/STEPS.length*100);
          students.push({key, ...data, done, pct});
        }
      } catch(e){}
    }
    students.sort((a,b)=>(b.updated||0)-(a.updated||0));
    allStudents = students;
    renderStudents(students);
    updateStats(students);
  } catch(e){
    container.innerHTML = `<div class="empty"><div class="empty-text" style="color:var(--muted)">Erro ao carregar dados. Verifique se o storage está disponível.</div></div>`;
  }
}

function updateStats(students){
  document.getElementById('stat-total').textContent = students.length;
  document.getElementById('stat-done').textContent = students.filter(s=>s.pct===100).length;
  const avg = students.length ? Math.round(students.reduce((a,s)=>a+s.pct,0)/students.length) : 0;
  document.getElementById('stat-avg').textContent = avg + '%';
  document.getElementById('stat-active').textContent = students.filter(s=>s.pct>0&&s.pct<100).length;
}

function renderStudents(students){
  const container = document.getElementById('students-container');
  if(students.length===0){
    container.innerHTML = `<div class="empty"><div class="empty-icon">👥</div><div class="empty-text">Nenhum aluno ainda.</div></div>`;
    return;
  }
  container.innerHTML = students.map(s=>`
    <div class="student-row ${s.key===selectedId?'selected':''}" onclick="selectStudent('${s.key}')">
      <div class="avatar">${initials(s.name||'?')}</div>
      <div class="student-info">
        <div class="s-name">${s.name||'Aluno'}</div>
        <div class="s-meta">${s.done||0} de ${STEPS.length} etapas</div>
      </div>
      <div class="s-bar-wrap">
        <div class="s-bar-track"><div class="s-bar-fill" style="width:${s.pct}%"></div></div>
        <div class="s-pct">${s.pct}%</div>
      </div>
      <div class="s-updated">${s.updated?timeAgo(s.updated):''}</div>
      <svg class="s-chevron" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg>
    </div>`).join('');
}

function selectStudent(key){
  selectedId = key;
  renderStudents(allStudents);
  const s = allStudents.find(s=>s.key===key);
  if(!s) return;
  
  const panel = document.getElementById('detail-panel');
  panel.classList.add('open');
  document.getElementById('d-avatar').textContent = initials(s.name||'?');
  document.getElementById('d-name').textContent = s.name||'Aluno';
  document.getElementById('d-updated').textContent = s.updated ? 'Atualizado ' + timeAgo(s.updated) : '';
  document.getElementById('d-pct').textContent = s.pct+'%';
  
  const stepsHtml = STEPS.map(step=>{
    const sd = (s.steps||{})[step.id] || {status:'todo',note:''};
    return `<div class="detail-step ${sd.status==='done'?'done':sd.status==='progress'?'in-progress':''}">
      <div class="ds-row">
        <div class="ds-dot ${sd.status}"></div>
        <div class="ds-title">${step.title}</div>
        <span class="ds-badge ${sd.status}">${sd.status==='done'?'Concluído':sd.status==='progress'?'Em andamento':'A fazer'}</span>
      </div>
      ${sd.note?`<div class="ds-note">"${sd.note}"</div>`:''}
    </div>`;
  }).join('');
  document.getElementById('d-steps').innerHTML = stepsHtml;
  panel.scrollIntoView({behavior:'smooth',block:'nearest'});
}

loadStudents();
setInterval(loadStudents, 30000);
</script>
</body>
</html>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Checklist Beabá da Licitação — Sociedade da Licitação</title>
<link href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@400;600;700;900&family=Barlow:wght@400;500;600&display=swap" rel="stylesheet"/>
<style>
:root {
  --green: #22c55e;
  --green-dark: #16a34a;
  --green-glow: rgba(34,197,94,0.15);
  --green-dim: rgba(34,197,94,0.08);
  --black: #080808;
  --surface: #111111;
  --surface2: #1a1a1a;
  --border: rgba(255,255,255,0.07);
  --border-green: rgba(34,197,94,0.3);
  --text: #f0f0f0;
  --muted: #888;
  --muted2: #555;
}
*{margin:0;padding:0;box-sizing:border-box}
html{background:var(--black)}
body{
  font-family:'Barlow',sans-serif;
  background:var(--black);
  color:var(--text);
  min-height:100vh;
  padding-bottom:4rem;
}

/* HEADER */
.top-bar{
  background:var(--surface);
  border-bottom:1px solid var(--border);
  padding:1rem 1.5rem;
  display:flex;
  align-items:center;
  gap:12px;
  position:sticky;
  top:0;
  z-index:100;
}
.logo-mark{
  width:36px;height:36px;
  background:var(--green);
  border-radius:6px;
  display:flex;align-items:center;justify-content:center;
  font-family:'Barlow Condensed',sans-serif;
  font-weight:900;font-size:18px;
  color:#000;letter-spacing:-1px;
}
.brand-name{
  font-family:'Barlow Condensed',sans-serif;
  font-weight:700;font-size:14px;
  color:var(--text);line-height:1.1;
}
.brand-sub{font-size:11px;color:var(--muted);font-weight:400}
.student-pill{
  margin-left:auto;
  background:var(--green-dim);
  border:1px solid var(--border-green);
  color:var(--green);
  font-size:12px;font-weight:600;
  padding:4px 12px;border-radius:20px;
  max-width:160px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;
}

/* HERO */
.hero{
  padding:2rem 1.5rem 1.5rem;
  border-bottom:1px solid var(--border);
}
.hero-label{
  font-size:11px;font-weight:600;letter-spacing:0.12em;
  text-transform:uppercase;color:var(--green);
  margin-bottom:8px;
}
.hero-title{
  font-family:'Barlow Condensed',sans-serif;
  font-weight:900;font-size:clamp(28px,6vw,42px);
  line-height:1;text-transform:uppercase;
  margin-bottom:8px;
}
.hero-title span{color:var(--green)}
.hero-desc{font-size:14px;color:var(--muted);line-height:1.5;max-width:480px}

/* PROGRESS */
.progress-wrap{
  padding:1.25rem 1.5rem;
  border-bottom:1px solid var(--border);
  background:var(--surface);
}
.progress-header{
  display:flex;justify-content:space-between;align-items:center;
  margin-bottom:10px;
}
.progress-label{font-size:13px;color:var(--muted)}
.progress-pct{
  font-family:'Barlow Condensed',sans-serif;
  font-weight:700;font-size:20px;color:var(--green);
}
.progress-track{
  height:6px;background:var(--surface2);border-radius:3px;overflow:hidden;
}
.progress-fill{
  height:100%;background:var(--green);border-radius:3px;
  transition:width 0.4s cubic-bezier(.4,0,.2,1);
}

/* STEPS */
.steps{padding:1rem 1.5rem;display:flex;flex-direction:column;gap:10px}
.section-label{
  font-size:10px;font-weight:700;letter-spacing:0.15em;
  text-transform:uppercase;color:var(--muted2);
  padding:0.75rem 0 4px;
  border-top:1px solid var(--border);
  margin-top:4px;
}
.section-label:first-child{border-top:none;padding-top:0}

.step-card{
  background:var(--surface);
  border:1px solid var(--border);
  border-radius:10px;
  overflow:hidden;
  transition:border-color 0.2s;
}
.step-card.done{border-color:var(--border-green)}
.step-card.in-progress{border-color:rgba(234,179,8,0.25)}

.step-top{
  display:flex;align-items:center;gap:12px;
  padding:14px;cursor:pointer;
  -webkit-tap-highlight-color:transparent;
}
.step-num{
  width:28px;height:28px;border-radius:50%;
  border:1.5px solid var(--muted2);
  display:flex;align-items:center;justify-content:center;
  font-size:12px;font-weight:700;color:var(--muted);
  flex-shrink:0;transition:all 0.2s;
  font-family:'Barlow Condensed',sans-serif;
}
.step-card.done .step-num{
  background:var(--green);border-color:var(--green);color:#000;
}
.step-card.in-progress .step-num{
  border-color:#eab308;color:#eab308;
}
.step-num svg{width:14px;height:14px;display:none}
.step-card.done .step-num svg{display:block}
.step-card.done .step-num span{display:none}

.step-text{flex:1;min-width:0}
.step-title{font-size:14px;font-weight:600;line-height:1.3;margin-bottom:2px}
.step-sub{font-size:12px;color:var(--muted);line-height:1.3}
.step-chevron{
  color:var(--muted2);transition:transform 0.2s;flex-shrink:0;
}
.step-card.open .step-chevron{transform:rotate(180deg)}

.step-body{
  display:none;padding:0 14px 14px;
  border-top:1px solid var(--border);
}
.step-card.open .step-body{display:block}

.step-desc{
  font-size:13px;color:var(--muted);line-height:1.6;
  padding:12px 0;
}
.step-links{display:flex;flex-wrap:wrap;gap:8px;margin-bottom:14px}
.step-link{
  display:inline-flex;align-items:center;gap:6px;
  font-size:12px;font-weight:600;
  padding:6px 12px;border-radius:6px;
  background:var(--green-dim);border:1px solid var(--border-green);
  color:var(--green);text-decoration:none;
  transition:background 0.15s;
}
.step-link:hover{background:rgba(34,197,94,0.15)}
.step-link svg{width:12px;height:12px;flex-shrink:0}

/* STATUS BUTTONS */
.status-row{display:flex;gap:6px;margin-bottom:12px;flex-wrap:wrap}
.s-btn{
  font-size:12px;font-weight:600;
  padding:6px 14px;border-radius:6px;
  border:1px solid var(--border);
  background:none;color:var(--muted);cursor:pointer;
  transition:all 0.15s;
  font-family:'Barlow',sans-serif;
}
.s-btn:hover{border-color:var(--muted);color:var(--text)}
.s-btn.active-todo{border-color:var(--muted);color:var(--text);background:var(--surface2)}
.s-btn.active-progress{border-color:#eab308;color:#eab308;background:rgba(234,179,8,0.08)}
.s-btn.active-done{border-color:var(--green);color:var(--green);background:var(--green-dim)}

/* NOTE */
.note-label{font-size:11px;font-weight:600;letter-spacing:0.08em;text-transform:uppercase;color:var(--muted2);margin-bottom:6px}
.note-textarea{
  width:100%;background:var(--surface2);
  border:1px solid var(--border);border-radius:6px;
  color:var(--text);font-family:'Barlow',sans-serif;
  font-size:13px;padding:10px;resize:vertical;min-height:80px;
  outline:none;transition:border-color 0.15s;line-height:1.5;
}
.note-textarea:focus{border-color:var(--border-green)}
.note-actions{display:flex;align-items:center;gap:10px;margin-top:8px}
.save-btn{
  font-size:12px;font-weight:600;
  padding:7px 18px;border-radius:6px;
  border:1px solid var(--green);
  background:var(--green);color:#000;
  cursor:pointer;font-family:'Barlow',sans-serif;
  transition:opacity 0.15s;
}
.save-btn:hover{opacity:0.85}
.save-ok{
  font-size:12px;color:var(--green);display:none;
  align-items:center;gap:4px;
}
.save-ok.show{display:flex}

/* TOAST */
.toast{
  position:fixed;bottom:24px;left:50%;transform:translateX(-50%) translateY(20px);
  background:var(--surface);border:1px solid var(--border-green);
  color:var(--green);font-size:13px;font-weight:600;
  padding:10px 20px;border-radius:8px;
  opacity:0;transition:all 0.3s;pointer-events:none;z-index:999;
  white-space:nowrap;
}
.toast.show{opacity:1;transform:translateX(-50%) translateY(0)}

/* NAME GATE */
.gate{
  min-height:100vh;display:flex;align-items:center;justify-content:center;
  padding:2rem;
}
.gate-card{
  background:var(--surface);border:1px solid var(--border);
  border-radius:16px;padding:2rem;max-width:400px;width:100%;
  text-align:center;
}
.gate-logo{
  width:56px;height:56px;background:var(--green);
  border-radius:10px;display:flex;align-items:center;justify-content:center;
  font-family:'Barlow Condensed',sans-serif;font-weight:900;font-size:26px;
  color:#000;margin:0 auto 1.5rem;
}
.gate-title{
  font-family:'Barlow Condensed',sans-serif;font-weight:900;
  font-size:28px;text-transform:uppercase;margin-bottom:6px;
}
.gate-title span{color:var(--green)}
.gate-desc{font-size:14px;color:var(--muted);margin-bottom:1.5rem;line-height:1.5}
.gate-input{
  width:100%;background:var(--surface2);
  border:1px solid var(--border);border-radius:8px;
  color:var(--text);font-family:'Barlow',sans-serif;
  font-size:15px;padding:12px 16px;
  outline:none;margin-bottom:12px;
  transition:border-color 0.15s;
}
.gate-input:focus{border-color:var(--border-green)}
.gate-btn{
  width:100%;padding:13px;border-radius:8px;
  background:var(--green);border:none;
  color:#000;font-family:'Barlow Condensed',sans-serif;
  font-weight:900;font-size:18px;text-transform:uppercase;
  cursor:pointer;letter-spacing:0.05em;
  transition:opacity 0.15s;
}
.gate-btn:hover{opacity:0.85}
</style>
</head>
<body>

<div id="gate-screen" class="gate" style="display:none">
  <div class="gate-card">
    <div class="gate-logo">SL</div>
    <div class="gate-title">Beabá da <span>Licitação</span></div>
    <p class="gate-desc">Digite seu nome para acessar seu checklist personalizado e acompanhar sua evolução.</p>
    <input class="gate-input" id="gate-name" placeholder="Seu nome completo" type="text" maxlength="60"/>
    <button class="gate-btn" onclick="enterChecklist()">Acessar meu checklist →</button>
  </div>
</div>

<div id="main-screen" style="display:none">
  <div class="top-bar">
    <div class="logo-mark">SL</div>
    <div>
      <div class="brand-name">Sociedade da Licitação</div>
      <div class="brand-sub">Pedrão da Licitação</div>
    </div>
    <div class="student-pill" id="student-pill">—</div>
  </div>

  <div class="hero">
    <div class="hero-label">Checklist beabá</div>
    <div class="hero-title">Primeira venda <span>em 30 dias</span></div>
    <div class="hero-desc">Siga cada etapa, marque seu progresso e adicione suas anotações. Seu mentor acompanha tudo em tempo real.</div>
  </div>

  <div class="progress-wrap">
    <div class="progress-header">
      <span class="progress-label" id="prog-label">0 de 8 etapas concluídas</span>
      <span class="progress-pct" id="prog-pct">0%</span>
    </div>
    <div class="progress-track">
      <div class="progress-fill" id="prog-fill" style="width:0%"></div>
    </div>
  </div>

  <div class="steps" id="steps-container"></div>
</div>

<div class="toast" id="toast"></div>

<script>
const STEPS = [
  {
    id:'cnpj', section:'Pré-requisitos',
    title:'CNPJ e situação cadastral',
    sub:'Verifique se está 100% OK ou abra um MEI',
    desc:'Se você já tem CNPJ, certifique-se de que está 100% regular e sem nenhuma pendência. Se não tem, abra um MEI — com CPF você pagaria 27% de imposto, com MEI é zero.',
    links:[
      {label:'Abrir MEI',url:'https://www.gov.br/empresas-e-negocios/pt-br/empreendedor/quero-ser-mei/registro'},
      {label:'Consultar CNPJ',url:'https://www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/cnpjreva_Solicitacao.asp'}
    ]
  },
  {
    id:'sicaf14', section:'Pré-requisitos',
    title:'SICAF — Níveis I ao IV',
    sub:'Credenciamento, habilitação jurídica, regularidade fiscal',
    desc:'O SICAF é gratuito e 100% digital. Faça os 4 primeiros níveis: Credenciamento, Habilitação Jurídica, Regularidade Fiscal Federal e Trabalhista, e Regularidade Fiscal Estadual e Municipal.',
    links:[
      {label:'Acessar SICAF',url:'https://www.comprasgovernamentais.gov.br/index.php/sicaf'}
    ]
  },
  {
    id:'sicaf56', section:'Pré-requisitos',
    title:'SICAF — Níveis V e VI',
    sub:'Não obrigatório para começar!',
    desc:'Os Níveis V (atestados técnicos) e VI (balanço patrimonial) NÃO são necessários para começar. Foque em processos que não exigem atestado nem balanço — há muitos deles.',
    links:[]
  },
  {
    id:'nicho', section:'Estratégia',
    title:'Escolha do nicho',
    sub:'Demanda alta + burocracia baixa',
    desc:'Nichos recomendados: Elétrica, Ferramentas, Informática, Descartáveis, Produtos de escritório, Papelaria, Alimentos não perecíveis. Isso é sugestão — se tiver facilidade em outro nicho, comece por ele.',
    links:[]
  },
  {
    id:'captacao', section:'Operação diária',
    title:'Captação de editais',
    sub:'Mínimo 2 licitações por dia',
    desc:'Busque ao menos 2 licitações por dia no seu nicho. Priorize processos que ocorrem em aproximadamente 1 semana para ter tempo de fazer uma boa cotação.',
    links:[
      {label:'Portal ComprasGov',url:'https://www.compras.gov.br/'},
      {label:'Licitações-e',url:'https://www.licitacoes-e.com.br/'}
    ]
  },
  {
    id:'cotacao', section:'Operação diária',
    title:'Cotação de preços',
    sub:'1 cotação/dia = 5 por semana',
    desc:'Dos 2 processos captados, escolha 1 para cotar por dia. Assim você acumula 5 cotações na semana, aumentando muito sua chance de encontrar margem boa.',
    links:[]
  },
  {
    id:'proposta', section:'Operação diária',
    title:'Cadastro da proposta',
    sub:'Registre no portal indicado pelo edital',
    desc:'Das licitações em que você fez cotação e teve preço competitivo, cadastre a proposta no portal do edital para participar da fase de lances.',
    links:[
      {label:'Portal ComprasGov',url:'https://www.compras.gov.br/'},
      {label:'BLL Compras',url:'https://bllcompras.com/'}
    ]
  },
  {
    id:'lances', section:'Operação diária',
    title:'Fase de lances e entrega',
    sub:'Entre na hora, dispute, aprenda',
    desc:'Entre no portal na data e hora marcada. Se ganhar: envie a documentação e aguarde a nota de empenho. Se perder: analise a documentação do concorrente, a marca e a margem dele. Isso é aprendizado para a próxima.',
    links:[]
  }
];

let userId = null;
let studentName = null;

function getKey(stepId, type){ return `sl_${userId}_${stepId}_${type}`; }

function loadStep(stepId){
  return {
    status: localStorage.getItem(getKey(stepId,'status')) || 'todo',
    note: localStorage.getItem(getKey(stepId,'note')) || ''
  };
}

function saveStepData(stepId, status, note){
  localStorage.setItem(getKey(stepId,'status'), status);
  localStorage.setItem(getKey(stepId,'note'), note);
  syncToShared(stepId, status, note);
}

async function syncToShared(stepId, status, note){
  try {
    const allData = {};
    STEPS.forEach(s => {
      allData[s.id] = loadStep(s.id);
    });
    allData[stepId] = {status, note};
    const key = `sl_progress_${userId}`;
    await window.storage?.set(key, JSON.stringify({
      name: studentName,
      updated: Date.now(),
      steps: allData
    }), true);
  } catch(e){}
}

function calcProgress(){
  let done = 0;
  STEPS.forEach(s => {
    if(loadStep(s.id).status === 'done') done++;
  });
  return {done, total: STEPS.length, pct: Math.round(done/STEPS.length*100)};
}

function updateProgressBar(){
  const {done, total, pct} = calcProgress();
  document.getElementById('prog-fill').style.width = pct + '%';
  document.getElementById('prog-pct').textContent = pct + '%';
  document.getElementById('prog-label').textContent = `${done} de ${total} etapas concluídas`;
}

function showToast(msg){
  const t = document.getElementById('toast');
  t.textContent = msg;
  t.classList.add('show');
  setTimeout(() => t.classList.remove('show'), 2000);
}

function buildSteps(){
  const container = document.getElementById('steps-container');
  container.innerHTML = '';
  let lastSection = '';
  STEPS.forEach((step, i) => {
    if(step.section !== lastSection){
      const label = document.createElement('div');
      label.className = 'section-label';
      label.textContent = step.section;
      container.appendChild(label);
      lastSection = step.section;
    }
    const sd = loadStep(step.id);
    const card = document.createElement('div');
    card.className = `step-card ${sd.status === 'done' ? 'done' : sd.status === 'progress' ? 'in-progress' : ''}`;
    card.id = 'card-' + step.id;

    const linksHtml = step.links.length ? `<div class="step-links">${step.links.map(l=>`
      <a class="step-link" href="${l.url}" target="_blank">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M18 13v6a2 2 0 01-2 2H5a2 2 0 01-2-2V8a2 2 0 012-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>
        ${l.label}
      </a>`).join('')}</div>` : '';

    card.innerHTML = `
      <div class="step-top" onclick="toggleCard('${step.id}')">
        <div class="step-num">
          <span>${i+1}</span>
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"/></svg>
        </div>
        <div class="step-text">
          <div class="step-title">${step.title}</div>
          <div class="step-sub">${step.sub}</div>
        </div>
        <svg class="step-chevron" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="6 9 12 15 18 9"/></svg>
      </div>
      <div class="step-body">
        <p class="step-desc">${step.desc}</p>
        ${linksHtml}
        <div class="status-row">
          <button class="s-btn ${sd.status==='todo'?'active-todo':''}" onclick="setStatus('${step.id}','todo',event)">A fazer</button>
          <button class="s-btn ${sd.status==='progress'?'active-progress':''}" onclick="setStatus('${step.id}','progress',event)">Em andamento</button>
          <button class="s-btn ${sd.status==='done'?'active-done':''}" onclick="setStatus('${step.id}','done',event)">Concluído ✓</button>
        </div>
        <div class="note-label">Minha anotação</div>
        <textarea class="note-textarea" id="note-${step.id}" placeholder="Escreva dúvidas, observações ou links úteis...">${sd.note}</textarea>
        <div class="note-actions">
          <button class="save-btn" onclick="saveNote('${step.id}')">Salvar anotação</button>
          <span class="save-ok" id="ok-${step.id}">
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3"><polyline points="20 6 9 17 4 12"/></svg>
            Salvo!
          </span>
        </div>
      </div>`;
    container.appendChild(card);
  });
}

function toggleCard(id){
  const card = document.getElementById('card-'+id);
  card.classList.toggle('open');
}

function setStatus(stepId, status, e){
  e.stopPropagation();
  const note = document.getElementById('note-'+stepId)?.value || '';
  saveStepData(stepId, status, note);
  const card = document.getElementById('card-'+stepId);
  card.className = `step-card open ${status==='done'?'done':status==='progress'?'in-progress':''}`;
  card.querySelectorAll('.s-btn').forEach(b=>b.className='s-btn');
  const btns = card.querySelectorAll('.s-btn');
  if(status==='todo') btns[0].classList.add('active-todo');
  if(status==='progress') btns[1].classList.add('active-progress');
  if(status==='done') btns[2].classList.add('active-done');
  updateProgressBar();
  if(status==='done') showToast('✓ Etapa concluída! Continue assim.');
}

function saveNote(stepId){
  const note = document.getElementById('note-'+stepId).value;
  const status = loadStep(stepId).status;
  saveStepData(stepId, status, note);
  const ok = document.getElementById('ok-'+stepId);
  ok.classList.add('show');
  setTimeout(()=>ok.classList.remove('show'),2000);
}

function enterChecklist(){
  const name = document.getElementById('gate-name').value.trim();
  if(!name){ alert('Digite seu nome para continuar'); return; }
  studentName = name;
  userId = 'student_' + name.toLowerCase().replace(/[^a-z0-9]/g,'') + '_' + btoa(name).replace(/[^a-z0-9]/gi,'').slice(0,8);
  localStorage.setItem('sl_current_user', userId);
  localStorage.setItem('sl_current_name', name);
  launchApp();
}

function launchApp(){
  document.getElementById('gate-screen').style.display = 'none';
  document.getElementById('main-screen').style.display = 'block';
  document.getElementById('student-pill').textContent = studentName;
  buildSteps();
  updateProgressBar();
}

function init(){
  const savedId = localStorage.getItem('sl_current_user');
  const savedName = localStorage.getItem('sl_current_name');
  if(savedId && savedName){
    userId = savedId;
    studentName = savedName;
    launchApp();
  } else {
    document.getElementById('gate-screen').style.display = 'flex';
  }
}

document.getElementById('gate-name')?.addEventListener('keydown', e => {
  if(e.key === 'Enter') enterChecklist();
});

init();
</script>
</body>
</html>
