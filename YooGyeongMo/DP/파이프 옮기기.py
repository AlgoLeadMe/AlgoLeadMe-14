n = int(input())
board = [list(map(int, input().split())) for _ in range(n)]

# 상태: 가로(0), 세로(1), 대각선(2)
# dp[state][r][c] = 해당 위치에서 가능한 경로 수
dp = [[[-1] * n for _ in range(n)] for _ in range(3)]

def move_pipe(state, r, c):
    # 끝에 도달하면 1
    if r == n - 1 and c == n - 1:
        return 1

    # 이미 계산된 경로라면 재사용
    if dp[state][r][c] != -1:
        return dp[state][r][c]

    total = 0

    # 가로 이동
    if state != 1 and c + 1 < n and board[r][c + 1] == 0:
        total += move_pipe(0, r, c + 1)

    # 세로 이동
    if state != 0 and r + 1 < n and board[r + 1][c] == 0:
        total += move_pipe(1, r + 1, c)

    # 대각선 이동
    if r + 1 < n and c + 1 < n:
        if board[r][c + 1] == 0 and board[r + 1][c] == 0 and board[r + 1][c + 1] == 0:
            total += move_pipe(2, r + 1, c + 1)

    dp[state][r][c] = total
    return total

print(move_pipe(0, 0, 1))