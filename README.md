# job-screening · 校招选岗 Skill

[English](README.md) · [简体中文](README.zh-CN.md)

[ClawHub](https://clawhub.ai/ekko237/skills/job-screening) · [Usage](#quick-use) · [Issues](https://github.com/Ekko237/job-screening-skill/issues) · [MIT license](LICENSE)

For students and recent graduates using Codex or Claude Code for campus recruiting. Give the skill one company's job list. It recommends 1–3 roles to apply for, explains which offers the best chance, and tells you why it skipped each remaining role.

When application slots are limited, job titles can hide the actual work, and a promising role can turn out to require a different degree or location. The skill checks those requirements before ranking and backs each recommendation with evidence a recruiter can see on the résumé you plan to submit.

Install stable version [v1.0.2](https://github.com/Ekko237/job-screening-skill/releases/tag/v1.0.2):

```bash
git clone --branch v1.0.2 --depth 1 https://github.com/Ekko237/job-screening-skill.git job-screening-skill
cd job-screening-skill
bash install.sh
```

## Requirements

- An installed and signed-in Codex or Claude Code session for the full workflow. The default installer looks for an existing `~/.codex` or `~/.claude` directory.
- `git` to clone the release, and `bash` and `rsync` to run the installer.
- Your résumé and a job list from one company.

## Quick use

### 1. Install the skill

Run the pinned command above. The default installer copies the skill to each available destination.

| Agent | Skill directory |
| --- | --- |
| Codex | `~/.codex/skills/job-screening/` |
| Claude Code | `~/.claude/skills/job-screening/` |

The installer preserves `profile/` and files that exist only at the destination. If it finds a same-name installation it doesn't recognize, it backs up that directory as `job-screening.bak-<timestamp>` and stops. To replace that installation after reviewing the backup, run `bash install.sh --force` from the pinned checkout. Your profile is preserved.

For a manual install, copy `SKILL.md` and `references/` from the pinned checkout into the matching skill directory. Keep any existing `profile/`.

### 2. Open your agent and set up your profile

Say “用 job-screening” or “帮我筛一下秋招岗位” in Codex or Claude Code. Allow about 10 minutes for this one-time setup.

1. Share your résumé files (PDF, Word or images) and identify the version you actually submit.
2. Answer a short interview about target roles, exclusions, acceptable cities, graduation and start dates, and application preferences.
3. Review additional role directions and search terms the skill finds in your résumé evidence.
4. Correct the draft profile before using it to screen jobs. The installed skill keeps it in its local `profile/` folder, which is gitignored.

### 3. Send one company's job list

Paste text or attach screenshots, a PDF or an Excel job list, or share the recruiting link. Include how many applications the company allows if you know. You get a ranked shortlist, résumé evidence and risks for the recommended roles, and a reason for every role screened out so you can catch mistakes.

## When not to use it

- Company selection and résumé writing are outside the skill's scope.
- The full workflow requires a signed-in Codex or Claude Code session.
- Leave out sensitive information you are unwilling to share with your agent's configured model or provider. See [Privacy](#privacy).
- Browser `localStorage` is inapplicable. The installed skill keeps your profile in local files.

## Compared with alternatives

| Approach | What you do | What you get |
| --- | --- | --- |
| Screen manually | Open postings and track requirements and trade-offs yourself | A shortlist and any reasoning you record |
| Ask an agent in a fresh chat | Provide the job list and restate your constraints and ranking criteria | An answer shaped by that prompt |
| Use job-screening | Set up your profile once, then send one company's list at a time | A shortlist checked against the résumé you submit, with reasons for every exclusion |

## Example output

Fictional template. The roles, counts, referral detail and résumé references are placeholders.

```text
Apply for these 2 roles

1. XX Product Manager | Top choice
- Fit: High
- Interview outlook: High — trainee program, 42 openings, referral code available
- Visible evidence: The three supporting points appear in the second paragraph
  of the résumé you plan to submit.
- Why this role: [Cite the relevant résumé evidence.]
- Risk: [Likely interview follow-up.] The program could place you in operations.

2. XX Product Manager | Backup
[Fit, evidence, rationale and risks.]

Screened out (17)
- [XX role]: Requires a master's degree or higher.
- [XX role]: Operations job family, which you ruled out.
[Include every remaining role and its reason.]

Things to check
[Open questions and risks.]
```

## How screening works

1. **Apply hard filters.** Check degree, location and other constraints. Get the full posting for every recommended role to verify its requirements.
2. **Rank across four layers.** Determine the job family from the first three duties, then consider business fit, candidate competitiveness and likelihood of acceptance. The fourth layer considers the chances of getting in, including hiring signals such as trainee-program intake.
3. **Check visible evidence.** The résumé the recruiter will see must contain the evidence used to argue fit. An experience that appears only in a portfolio, website or chat cannot support that recommendation. The skill downgrades or removes recommendations that fail this check.
4. **Explain the result.** Give reasons for the shortlist and every exclusion. Correcting an eligibility fact, such as whether a bachelor's degree qualifies, clears that filter. Moving a role up requires a reason tied to the ranking criteria.

## Repository layout

```text
job-screening/
├── SKILL.md                       Screening workflow and output format
├── install.sh                     Codex and Claude Code installer
├── references/
│   ├── onboarding.md              Résumé intake, interview and profile setup
│   ├── opportunity-scan.md        Additional roles supported by résumé evidence
│   └── profile-template.md        Candidate profile template
└── profile/                       Local candidate profile (gitignored)
```

## Privacy

Screening runs in your own agent session. The skill has no separate server. The résumé text you share goes to the AI model or service provider configured for that agent.

The profile stays in the installed skill's gitignored `profile/` directory. Original résumé files stay where you keep them, and the profile can record their local paths. This repository contains no personal information. If you fork it, check that any changes you submit exclude résumés and profiles.

## Keywords

Job screening (选岗), campus recruiting (校招), agent skills (agent-skills), Claude Code (claude-code), Codex (codex).

## License

[MIT](LICENSE)
