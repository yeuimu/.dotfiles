module.exports = {
    types: [
      { value: '✨feat', name: 'feat:  新增 feature' },
      { value: '🐛fix', name: 'fix: 修复 bug' },
      { value: '📝docs', name: 'docs: 仅仅修改了文档，比如 README, CHANGELOG, CONTRIBUTE等等' },
      { value: '🔖style', name: 'style: 仅仅修改了空格、格式缩进、逗号等等，不改变代码逻辑' },
      { value: '🔧refactor', name: 'refactor: 代码重构，没有加新功能或者修复 bug' },
      { value: '🚀perf', name: 'perf: 优化相关，比如提升性能、体验' },
      { value: '📈test', name: 'test: 测试用例，包括单元测试、集成测试等' },
      { value: '🚧chore', name: 'chore: 改变构建流程、或者增加依赖库、工具等' },
      { value: '⬇️revert', name: 'revert: 回滚到上一个版本' },
    ],
    scopes: [
      { name: 'emacs' },
      { name: 'nvim' },
    ],
    messages: {
      type: '选择提交类型:',
      scope: '选择修改的范围 (可选):',
      subject: '简短描述 (最多72字):\n',
      body: '详细描述，使用 "|" 换行 (可选):\n',
      breaking: '列出任何破坏性变更 (可选):\n',
      footer: '相关Issue，例如 #123 (可选):\n',
      confirmCommit: '确认提交？'
    },
    allowBreakingChanges: ['feat', 'fix'],
    skipQuestions: ['body', 'footer'],
  };
  