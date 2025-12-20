#!/bin/bash
#Description: Auto scan and clean the biggest file in the machine

precheck() {
    df -h | awk '
    NR>1 {
        gsub("%", "", $(NF-1))
        usage = $(NF-1)
        fs = $1
        mount = $NF
        
        if (usage > 90) {
            status = "🚨 严重"
        } else if (usage > 80) {
            status = "⚠️  警告"
        } else {
            status = "✅ 正常"
        }
        
        printf "%-15s %-20s %3d%% %s\n", fs, mount, usage, status
    }'
}

main() {
    precheck
}

# 调用主函数
main "$@"
