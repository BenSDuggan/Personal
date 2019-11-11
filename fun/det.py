# Find the determinant of an array

# The main function to find the determinant of an array.  
# Assumptions to increase performance:
#   1) Assume the array is n x n
#   2) Assume n >= 1
global count
count = 0
def det(arr):
    if len(arr) == 1:
        return arr[0][0]

    answer = 0
    sign = 1
    for i in range(len(arr)):
        answer += arr[0][i] * sign * det(reduce_array(arr, i))
        sign *= -1

    global count
    count += 1
    print(count/(32*32))

    return answer

# Take an array and index and make it smaller
def reduce_array(arr, i):
    brr = []
    for j in range(1, len(arr)):
        brr.append(arr[j][0:i] + arr[j][i+1:])

    return brr


if __name__ == "__main__":
    arr = []
    for i in range(32):
        arr.append([])
        for j in range(32):
            arr[-1].append(i*32 + j)

    #arr = [[-2,2,-3], [-1, 1, 3], [2, 0, -1]]
    #arr = [[1, 2], [3, 4]]

    print(len(arr))
    print(len(arr[0]))
    print(det(arr))