# River Club — 双人在线德州扑克

## 当前状态
- Supabase 数据表 `public.river_poker_rooms` 已在项目中创建，RLS 已启用且客户端角色无直接表权限。
- 由于当前会话的部署工具拒绝部署 Edge Function，函数源码和前端包在这里，尚未部署完成，网页暂时不能联网运行。
- 仅用于虚拟筹码娱乐，不涉及真钱。

## 发布步骤
1. 在 Supabase Dashboard 打开项目。
2. 打开 Edge Functions，创建 `river-poker` 函数，把 `supabase/functions/river-poker/index.ts` 作为入口部署。
3. 在 Edge Function 的 Secrets 中确认存在 `SUPABASE_URL` 和 `SUPABASE_SERVICE_ROLE_KEY`（服务端环境变量，绝对不要写入网页）。
4. 打开 `index.html`，将 `SUPABASE_ANON_KEY` 的占位文本替换为项目的 legacy anon key。只把 anon/publishable key 放在浏览器端；严禁放 service role key。
5. 把 `index.html` 部署到静态网页托管服务（例如 Netlify / Vercel / Cloudflare Pages）。
6. 打开网页测试：一台设备创建房间，另一台设备输入房间号加入。

## 安全提醒
- 这份是可继续完善的原型代码，不应视为经过安全审计的生产游戏。
- 需进一步加强下注状态机、边池/全下规则、回合超时、重连、房间清理、并发更新与限流。
- 不要在公共频道分享玩家 token；token 等同于该座位的控制凭证。
