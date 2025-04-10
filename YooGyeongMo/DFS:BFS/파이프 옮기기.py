n = int(input())

board = []

for _ in range(n):
    board.append(list(map(int,input().split())))

answer = 0

def move_pipe(state,r,c):
    global answer

    if r == n-1 and c == n-1:
        answer+=1
        return

    can_move_h = c + 1 < n and board[r][c+1] == 0
    can_move_v = r + 1 < n and board[r+1][c] == 0

    if state != 1 and can_move_h:
        move_pipe(0, r, c + 1)
    if state != 0 and can_move_v:
        move_pipe(1, r+1, c)
    if c + 1 < n and r + 1 < n :
        if board[r][c+1] == 0 and board[r+1][c] == 0 and board[r+1][c+1] == 0:
            move_pipe(2, r + 1, c + 1)

move_pipe(0,0,1)
print(answer)