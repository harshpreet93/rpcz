package main

import (
	"github.com/docker/docker/client"
)

func main() {

	// file, _ := pkger.Open("/go.mod")
	// if _, err := io.Copy(os.Stdout, file); err != nil {
	// 	panic(err)
	// }

	// ctx := context.Background()
	// cli, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	cli, err := client.NewEnvClient()
	if err != nil {
		panic(err)
	}

	// imageName := "docker.io/library/alpine"

	// out, err := cli.ImagePull(ctx, imageName, types.ImagePullOptions{})
	// if err != nil {
	// 	panic(err)
	// }
	// io.Copy(os.Stdout, out)

	// resp, err := cli.ContainerCreate(ctx, &container.Config{
	// 	Image: imageName,
	// }, nil, nil, "")
	// if err != nil {
	// 	panic(err)
	// }

	// if err := cli.ContainerStart(ctx, resp.ID, types.ContainerStartOptions{}); err != nil {
	// 	panic(err)
	// }

	// fmt.Println(resp.ID)
}
